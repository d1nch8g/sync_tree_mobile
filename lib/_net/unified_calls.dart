import 'dart:convert';

import 'package:sync_tree_mobile/_local/crypto.dart';
import 'package:sync_tree_mobile/_local/storage.dart';
import 'package:sync_tree_mobile/_net/info_calls.dart';
import 'package:sync_tree_mobile/_net/user_calls.dart';

Future<String> updateName() async {
  var adress = await getPersonalAdressBytes();
  var userInfo = await infoUser(adress);
  saveValue(StorageKey.publicName, userInfo.name);
  return userInfo.name;
}

Future<bool> createNewUser() async {
  var pubKey = base64.decode(await loadValue(StorageKey.publicKey));
  var mesKey = base64.decode(await loadValue(StorageKey.publicMesKey));
  var name = await loadValue(StorageKey.publicName);
  var valuesList = [
    pubKey,
    mesKey,
    name,
  ];
  var sign = signList(valuesList);
  var createdSuccess = await userCreate(pubKey, mesKey, name, sign);
  return createdSuccess;
}
