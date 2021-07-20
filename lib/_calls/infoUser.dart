import 'dart:convert';

import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sync_tree_mobile/navigator.dart';

import '../_local/crypt.dart';
import '../_api/api.pb.dart';
import '../_api/api.pbgrpc.dart';
import '../_api/api.dart';

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

Future updateSelfInformation() async {
  try {
    var persAdress = await getPersonalAdress();
    final persInfo = await stub.infoUser(
      InfoUserRequest(
        adress: base64.decode(persAdress),
      ),
      options: CallOptions(
        timeout: Duration(milliseconds: 2584),
      ),
    );
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('pubName', persInfo.publicName);
    mainStreamController.add('pubNameEvent');
    prefs.setInt('balance', persInfo.balance.toInt());
    mainStreamController.add('balanceEvent');
    List<String> allMarkets = [];
    for (var i = 0; i < persInfo.marketAdresses.length; i++) {
      var adress = base64.encode(persInfo.marketAdresses[i]);
      prefs.setInt(
        adress,
        persInfo.marketBalances[i].toInt(),
      );
      mainStreamController.add(adress);
      allMarkets.add(adress);
    }
    prefs.setStringList('markets', allMarkets);
    mainStreamController.add('marketsEvent');
  } catch (Exception) {}
}
