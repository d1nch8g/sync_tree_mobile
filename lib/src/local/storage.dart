import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sync_tree_mobile_ui/src/src.dart';

import 'stream.dart';
import 'crypto.dart';

class Storage {
  static Future<bool> checkIfFirstLaunch() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool('fl') ?? true;
  }

  static void saveKeys(String keys) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('keys', keys);
  }

  static void firstLauchComplete() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('fl', false);
  }

  static Future<bool> chechIfKeysAreSaved() async {
    var prefs = await SharedPreferences.getInstance();
    var keys = prefs.getString('keys');
    if (keys == null) {
      return false;
    }
    return true;
  }

  static Future<Keys> loadKeys() async {
    var prefs = await SharedPreferences.getInstance();
    var keysString = prefs.getString('keys')!;
    return Keys.fromSingleString(multiKeyStirng: keysString);
  }

  static void savePassword(String password) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('password', password);
  }

  static Future<String> loadPassword() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString('password') ?? '';
  }

  static void saveMainBalance(double balance) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setDouble('balance', balance);
    triggerStorageEvent(trigger: Trigger.mainBalanceUpdate);
  }

  static Future<int> loadMainBalance() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getInt('balance') ?? 0;
  }

  static void saveConnectedWalletsAdressesList(List<String> wallets) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setStringList('wallets', wallets);
  }

  static Future<List<String>> loadConnectedWallets() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('wallets') ?? [];
  }

  static void saveMarketBalanceByAdress(String adress, int balance) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt(adress, balance);
    triggerStorageEvent(trigger: Trigger.marketBalanceUpdate);
  }

  static void removeAllWallets() async {
    var wallets = await Storage.loadConnectedWallets();
    Storage.saveConnectedWalletsAdressesList([]);
    wallets.forEach((wallet) {
      Storage.saveMarketBalanceByAdress(wallet, 0);
    });
  }

  static Future<int> loadMarketBalance(String adress) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getInt(adress) ?? 0;
  }

  static void savePublicName(String name) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
    triggerStorageEvent(trigger: Trigger.publicNameUpdate);
  }

  static Future<String> loadPublicName() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString('name') ?? 'name_err';
  }

  static void saveSearchCache(String cache) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('cache', cache);
  }

  static Future<String> loadSeachCache() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString('cache') ?? '';
  }

  static void triggerStorageEvent({
    required Trigger trigger,
  }) {
    storageStreamController.add(trigger);
  }

  static createTriggerSubscription({
    required Trigger trigger,
    required Function onTriggerEvent,
  }) {
    storageStream.listen((event) {
      if (trigger == event) {
        onTriggerEvent();
      }
    });
  }

  static Future<bool> checkIfMarketConnected(String adress) async {
    var connectedAdresses = await Storage.loadConnectedWallets();
    if (connectedAdresses.contains(adress)) {
      return true;
    }
    return false;
  }

  static void addConnectedMarket(String adress) async {
    var connectedAdresses = await Storage.loadConnectedWallets();
    if (!connectedAdresses.contains(adress)) {
      connectedAdresses.add(adress);
      Storage.saveConnectedWalletsAdressesList(connectedAdresses);
    }
  }

  static void removeConnectedMarket(String adress) async {
    var connectedAdresses = await Storage.loadConnectedWallets();
    print(connectedAdresses);
    connectedAdresses.remove(adress);
    print(connectedAdresses);
    Storage.saveConnectedWalletsAdressesList(connectedAdresses);
  }

  static void updateSelfInformation({required UserInfo info}) {
    saveMainBalance(info.balance.toDouble());
    info.marketBalances.forEach((marketBalance) {
      var adressString = base64Encode(marketBalance.adress);
      saveMarketBalanceByAdress(
        adressString,
        marketBalance.balance,
      );
    });
    savePublicName(info.name);
  }

  static void saveBottomPadding({required double padding}) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setDouble('bottompadding', padding);
  }

  static Future<double> loadBottomPadding() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('bottompadding') ?? 0;
  }

  static Future<String> loadSelfAdress() async {
    var keys = await Storage.loadKeys();
    return keys.personal.public.getAdressBase64();
  }
}
