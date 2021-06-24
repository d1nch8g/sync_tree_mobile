import 'dart:convert';

import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sync_tree_mobile/navigator.dart';
import '../crypt.dart';

import '../api/api.pb.dart';
import '../api/api.pbgrpc.dart';
import '../api/api.dart';

Future<String> userFindName(String adress) async {
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
    return '====';
  }
}

Future<Int64> userUpdateSeldBalance() async {
  var prefs = await SharedPreferences.getInstance();
  var crypt = Crypt();
  var personalAdress = await crypt.getPersonalAdress();
  final response = await stub.userInfo(
    UserInfoRequest(
      adress: base64.decode(personalAdress),
    ),
    options: CallOptions(
      timeout: Duration(milliseconds: 2584),
    ),
  );
  prefs.setInt(
    'balance',
    response.balance.toInt(),
  );
  mainStreamController.add('balanceChange');
  return response.balance;
}
