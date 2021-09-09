import 'dart:convert';

import 'package:sync_tree_mobile/_local/crypto.dart';
import 'package:sync_tree_mobile/_local/storage.dart';
import 'package:sync_tree_mobile/_net/info_calls.dart';
import 'package:sync_tree_mobile/_net/user_calls.dart';

Future<String> loadNameFromNet() async {
  var adress = await getPersonalAdressBytes();
  var userInfo = await infoUser(adress);
  saveValue(StorageKey.publicName, userInfo.name);
  return userInfo.name;
}

Future<bool> updateUserInfo() async {
  var publicKey = base64.decode(await loadValue(StorageKey.publicKey));
  var mesKey = base64.decode(await loadValue(StorageKey.publicMesKey));
  var name = await loadValue(StorageKey.publicName);
  var valuesList = [
    publicKey,
    mesKey,
    name,
  ];
  var sign = signList(valuesList);
  var updatedSuccessfully = await userUpdate(publicKey, mesKey, name, sign);
  return updatedSuccessfully;
}

Future<bool> createNewUser() async {
  var publicKey = base64.decode(await loadValue(StorageKey.publicKey));
  var mesKey = base64.decode(await loadValue(StorageKey.publicMesKey));
  var name = await loadValue(StorageKey.publicName);
  var valuesList = [
    publicKey,
    mesKey,
    name,
  ];
  var sign = signList(valuesList);
  var createdSuccess = await userCreate(publicKey, mesKey, name, sign);
  return createdSuccess;
}

Future<bool> sendAmountByAdress(String adressBase64, int amount) async {
  var publicKey = base64.decode(await loadValue(StorageKey.publicKey));
  var reciever = base64.decode(adressBase64);
  var valueList = [
    publicKey,
    amount,
    reciever,
  ];
  var sign = signList(valueList);
  var sendSuccess = await userSend(publicKey, amount, reciever, sign);
  return sendSuccess;
}
