import 'dart:typed_data';

import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../crypt.dart';

import '../api/api.pb.dart';
import '../api/api.pbgrpc.dart';
import '../api/api.dart';

Future<bool> userSell(Uint8List adress, Int64 offer, Int64 recieve) async {
  try {
    var crypt = Crypt();
    var prefs = await SharedPreferences.getInstance();
    var persPubString = prefs.getString('persPub') ?? '';
    var persPub = crypt.keyToBytes(persPubString);
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
    var sign = crypt.signMessage(persPrivString, concatmessage1);
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
  } catch (e) {
    return false;
  }
}
