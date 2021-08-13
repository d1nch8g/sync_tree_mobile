import 'dart:convert';
import 'dart:typed_data';

import 'package:grpc/grpc.dart';

import '../_local/crypt.dart';
import '../_api/api.pb.dart';
import '../_api/api.pbgrpc.dart';
import '../_api/api.dart';

Future<bool> hasTrades(context, Uint8List market) async {
  try {
    var adress = await getPersonalAdress();
    var user = base64.decode(adress);
    var stub = getStub(context);
    final response = await stub.infoHasTrades(
      InfoHasTradesRequest(
        userAdress: user,
        marketAdress: market,
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
