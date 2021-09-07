import 'dart:convert';
import 'dart:typed_data';

import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../_local/keys.dart';
import '../_local/crypt.dart';
import 'api.pb.dart';
import 'api.pbgrpc.dart';
import 'api.dart';

Future<bool> userBuy(
    context, Uint8List adress, Int64 offer, Int64 recieve) async {
  var prefs = await SharedPreferences.getInstance();
  var persPubString = prefs.getString('persPub') ?? '';
  var persPub = keyToBytes(persPubString);
  var offerBytes = offer.toBytes();
  var recieveBytes = recieve.toBytes();
  var concatmessage1 = Uint8List.fromList(
    []
      ..addAll(persPub)
      ..addAll(adress)
      ..addAll(recieveBytes)
      ..addAll(offerBytes),
  );
  var persPrivString = prefs.getString('persPriv') ?? '';
  var sign = signMessage(persPrivString, concatmessage1);
  var stub = getStub(context);
  final response = await stub.userBuy(
    UserBuyRequest(
      publicKey: persPub,
      adress: adress,
      recieve: recieve,
      offer: offer,
      sign: sign,
    ),
    options: CallOptions(
      timeout: Duration(milliseconds: 2584),
    ),
  );
  return response.passed;
}

Future<bool> userSell(
    context, Uint8List adress, Int64 offer, Int64 recieve) async {
  var stub = getStub(context);
  var prefs = await SharedPreferences.getInstance();
  var persPubString = prefs.getString('persPub') ?? '';
  var persPub = keyToBytes(persPubString);
  var offerBytes = offer.toBytes();
  var recieveBytes = recieve.toBytes();
  var concatmessage1 = Uint8List.fromList(
    []
      ..addAll(persPub)
      ..addAll(adress)
      ..addAll(recieveBytes)
      ..addAll(offerBytes),
  );
  var persPrivString = prefs.getString('persPriv') ?? '';
  var sign = signMessage(persPrivString, concatmessage1);
  final response = await stub.userSell(
    UserSellRequest(
      publicKey: persPub,
      adress: adress,
      recieve: recieve,
      offer: offer,
      sign: sign,
    ),
    options: CallOptions(
      timeout: Duration(milliseconds: 2584),
    ),
  );
  return response.passed;
}

Future<bool> userCancelTrade(context, Uint8List marketAdress) async {
  try {
    var keys = await getAllKeys();
    var persPub = keyToBytes(keys[Key.PersonalPublicKey]!);
    var concatmessage1 = Uint8List.fromList(
      []..addAll(persPub)..addAll(marketAdress),
    );
    var prefs = await SharedPreferences.getInstance();
    var persPrivString = prefs.getString('persPriv') ?? '';
    var sign = signMessage(persPrivString, concatmessage1);
    var stub = getStub(context);
    final response = await stub.userCancelTrade(
      UserCancelTradeRequest(
        publicKey: persPub,
        marketAdress: marketAdress,
        sign: sign,
      ),
      options: CallOptions(
        timeout: Duration(milliseconds: 2584),
      ),
    );
    return response.passed;
  } catch (e) {
    return false;
  }
}
