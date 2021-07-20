import 'dart:convert';
import 'dart:typed_data';

import 'package:grpc/grpc.dart';
import 'package:sync_tree_mobile/crypt.dart';

import '../api/api.pb.dart';
import '../api/api.pbgrpc.dart';
import '../api/api.dart';

Future<bool> hasTrades(Uint8List market) async {
  try {
    var adress = await Crypt().getPersonalAdress();
    var user = base64.decode(adress);
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
