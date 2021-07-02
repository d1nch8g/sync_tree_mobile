import 'dart:convert';
import 'dart:typed_data';

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
    final response = await stub.infoUser(
      InfoUserRequest(
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
  final response = await stub.infoUser(
    InfoUserRequest(
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

Future<Map<Uint8List, int>> getSelfMarketBalances() async {
  var crypt = Crypt();
  var personalAdress = await crypt.getPersonalAdress();
  final response = await stub.infoUser(
    InfoUserRequest(
      adress: base64.decode(personalAdress),
    ),
    options: CallOptions(
      timeout: Duration(milliseconds: 2584),
    ),
  );
  Map<Uint8List, int> balances = {};
  for (var i = 0; i < response.marketAdresses.length; i++) {
    var adress = Uint8List.fromList(response.marketAdresses[i]);
    balances[adress] = response.marketBalances[i].toInt();
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt(
      base64.encode(response.marketAdresses[i]),
      response.marketBalances[i].toInt(),
    );
  }
  return balances;
}
