import 'dart:typed_data';

import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../_local/keys.dart';
import '../_local/crypt.dart';
import '../_net/api.pb.dart';
import '../_net/api.pbgrpc.dart';
import '../_net/api.dart';

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
