import 'dart:convert';

import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import '../crypt.dart';

import '/api/api.pb.dart';
import '/api/api.pbgrpc.dart';
import '/api/api.dart';

Future<String> userName(String adress) async {
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
    return response.publicName;
  } catch (Exception) {
    return '';
  }
}

Future<Int64> selfBalance() async {
  try {
    var crypt = Crypt();
    var personalAdress = await crypt.getPersonalAdress();
    final response = await stub.userInfo(
      UserInfoRequest(
        adress: personalAdress,
      ),
      options: CallOptions(
        timeout: Duration(milliseconds: 2584),
      ),
    );
    return response.balance;
  } catch (Exception) {
    return Int64();
  }
}
