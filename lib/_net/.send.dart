import 'dart:convert';
import 'dart:typed_data';

import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../_local/crypt.dart';
import '../_local/keys.dart';
import '../_net/api.pb.dart';
import '../_net/api.pbgrpc.dart';
import '../_net/api.dart';

Future<bool> userSend(
    context, String recieverAdressBase64, Int64 amount) async {
  var prefs = await SharedPreferences.getInstance();
  var persPubString = prefs.getString('persPub') ?? '';
  var persPub = keyToBytes(persPubString);
  var recieverAdress = base64.decode(recieverAdressBase64);
  var amountAsBytes = amount.toBytes();
  var concatmessage1 = Uint8List.fromList(
      []..addAll(persPub)..addAll(amountAsBytes)..addAll(recieverAdress));
  var persPrivString = prefs.getString('persPriv') ?? '';
  var sign = signMessage(persPrivString, concatmessage1);
  var stub = getStub(context);
  final response = await stub.userSend(
    UserSendRequest(
      publicKey: persPub,
      sendAmount: amount,
      recieverAdress: recieverAdress,
      sign: sign,
    ),
    options: CallOptions(
      timeout: Duration(milliseconds: 2584),
    ),
  );
  return response.passed;
}
