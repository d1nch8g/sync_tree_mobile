import 'dart:convert';
import 'dart:typed_data';

import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../crypt.dart';

import '/api/api.pb.dart';
import '/api/api.pbgrpc.dart';
import '/api/api.dart';

/// list contains following things:
/// 1 - balance of the user
/// 2 - public name of the user
Future<List> userInfo(String adress) async {
  try {
    var adressAsBytes = base64.decode(adress);
    final response = await stub.userInfo(
      UserInfoRequest(
        adress: adressAsBytes,
      ),
      options: CallOptions(
        timeout: Duration(milliseconds: 2584),
      ),
    );
    return [
      response.balance,
      response.publicName,
    ];
  } catch (Exception) {
    return [
      '',
      0,
    ];
  }
}

Future<List> selfInfo() async {
  try {
    var crypt = Crypt();
    var personalAdress = await crypt.getPersonalAdressBase64();
    var adressAsBytes = base64.decode(personalAdress);
    final response = await stub.userInfo(
      UserInfoRequest(
        adress: adressAsBytes,
      ),
      options: CallOptions(
        timeout: Duration(milliseconds: 2584),
      ),
    );
    return [
      response.balance,
      response.publicName,
    ];
  } catch (Exception) {
    return [
      '',
      0,
    ];
  }
}
