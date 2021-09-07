import 'dart:convert';
import 'dart:typed_data';

import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../_local/keys.dart';
import '../_local/crypt.dart';
import '../_net/api.pb.dart';
import '../_net/api.pbgrpc.dart';
import '../_net/api.dart';

Future<bool> userCreate(context) async {
  var prefs = await SharedPreferences.getInstance();
  var persPubString = prefs.getString('persPub') ?? '';
  var persPub = keyToBytes(persPubString);
  var pubName = prefs.getString('pubName') ?? '';
  var pubNameBytes = utf8.encode(pubName);
  var mesPubString = prefs.getString('mesPub') ?? '';
  var mesPub = keyToBytes(mesPubString);
  var concatmessage1 = Uint8List.fromList(
      []..addAll(persPub)..addAll(mesPub)..addAll(pubNameBytes));
  var persPrivString = prefs.getString('persPriv') ?? '';
  var sign = signMessage(persPrivString, concatmessage1);
  var stub = getStub(context);
  final response = await stub.userCreate(
    UserCreateRequest(
      publicKey: persPub,
      messsageKey: mesPub,
      publicName: pubName,
      sign: sign,
    ),
    options: CallOptions(
      timeout: Duration(milliseconds: 2584),
    ),
  );
  return response.passed;
}

Future<bool> userUpdate(context) async {
  var prefs = await SharedPreferences.getInstance();
  var persPubString = prefs.getString('persPub') ?? '';
  var persPub = keyToBytes(persPubString);
  var pubName = prefs.getString('pubName') ?? '';
  var pubNameBytes = utf8.encode(pubName);
  var mesPubString = prefs.getString('mesPub') ?? '';
  var mesPub = keyToBytes(mesPubString);
  var concatmessage1 = Uint8List.fromList(
      []..addAll(persPub)..addAll(mesPub)..addAll(pubNameBytes));
  var persPrivString = prefs.getString('persPriv') ?? '';
  var sign = signMessage(persPrivString, concatmessage1);
  var stub = getStub(context);
  final response = await stub.userUpdate(
    UserUpdateRequest(
      publicKey: persPub,
      messsageKey: mesPub,
      publicName: pubName,
      sign: sign,
    ),
    options: CallOptions(
      timeout: Duration(milliseconds: 2584),
    ),
  );
  return response.passed;
}
