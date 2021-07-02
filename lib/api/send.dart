import 'dart:convert';
import 'dart:typed_data';

import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../crypt.dart';

import '../api/api.pb.dart';
import '../api/api.pbgrpc.dart';
import '../api/api.dart';

Future<bool> userSend(String recieverAdressBase64, Int64 amount) async {
  try {
    var crypt = Crypt();
    var prefs = await SharedPreferences.getInstance();
    var persPubString = prefs.getString('persPub') ?? '';
    var persPub = crypt.keyToBytes(persPubString);
    var recieverAdress = base64.decode(recieverAdressBase64);
    var amountAsBytes = amount.toBytes();
    var concatmessage1 = Uint8List.fromList(
        []..addAll(persPub)..addAll(amountAsBytes)..addAll(recieverAdress));
    var persPrivString = prefs.getString('persPriv') ?? '';
    var sign = crypt.signMessage(persPrivString, concatmessage1);
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
  } catch (Exception) {
    return false;
  }
}