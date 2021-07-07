import 'dart:convert';
import 'dart:typed_data';
import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../crypt.dart';
import '../api/api.pb.dart';
import '../api/api.pbgrpc.dart';
import '../api/api.dart';

Future<bool> userCancelTrade(Uint8List marketAdress) async {
  try {
    var crypt = Crypt();
    var keys = await crypt.getAllKeys();
    var persPub = crypt.keyToBytes(keys[Key.PersonalPublicKey]!);
    var concatmessage1 = Uint8List.fromList(
      []..addAll(persPub)..addAll(marketAdress),
    );
    var prefs = await SharedPreferences.getInstance();
    var persPrivString = prefs.getString('persPriv') ?? '';
    var sign = crypt.signMessage(persPrivString, concatmessage1);
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
