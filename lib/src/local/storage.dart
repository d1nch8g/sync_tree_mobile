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

  static void saveMainBalance(int balance) async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('balance') != balance) {
      prefs.setInt('balance', balance);
      mainStreamController.add(Trigger.mainBalanceUpdate);
    }
  }

  static Future<int> loadMainBalance() async {
    var prefs = await SharedPreferences.getInstance();
    var recievedInt = prefs.getInt('balance') ?? 0;
    return recievedInt;
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
    if (prefs.getInt('adress') != balance) {
      prefs.setInt(adress, balance);
      mainStreamController.add(Trigger.marketBalanceUpdate);
    }
  }

  static void removeAllWallets() async {
    var wallets = await Storage.loadConnectedWallets();
    var prefs = await SharedPreferences.getInstance();
    Storage.saveConnectedWalletsAdressesList([]);
    wallets.forEach((wallet) {
      Storage.saveMarketBalanceByAdress(wallet, 0);
      prefs.setStringList('msgs$wallet', []);
    });
  }

  static Future<int> loadMarketBalance(String adress) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getInt(adress) ?? 0;
  }

  static void savePublicName(String name) async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('name') != name) {
      prefs.setString('name', name);
      mainStreamController.add(Trigger.publicNameUpdate);
    }
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
    saveMainBalance(info.balance.toInt());
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

  static void addMessage({
    required String message,
    required String adress,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    var messages = prefs.getStringList('msgs$adress') ?? [];
    messages.add(message);
    prefs.setStringList('msgs$adress', messages);
  }

  static Future<List<String>> loadMessages(String adress) async {
    var prefs = await SharedPreferences.getInstance();
    var messages = prefs.getStringList('msgs$adress') ?? [];
    return messages;
  }

  static void saveMarketWalletPosition(String adress, int position) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt('chpos$adress', position);
  }

  static Future<int> loadMarketWalletPosition(String adress) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getInt('chpos$adress') ?? 0;
  }

  static void saveMarketInfoCache(MarketInfo info) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('name${info.adress}', info.name);
    prefs.setString('description${info.adress}', info.description);
    prefs.setString('imageLink${info.adress}', info.imageLink);
    prefs.setString('workTime${info.adress}', info.workTime);
    prefs.setInt('delimiter${info.adress}', info.delimiter);
    prefs.setInt('operationCount${info.adress}', info.operationCount);
    prefs.setInt('inputFee${info.adress}', info.inputFee);
    prefs.setInt('outputFee${info.adress}', info.outputFee);
    prefs.setString('messageKey${info.adress}', base64Encode(info.messageKey));
  }

  static Future<MarketInfo> loadMarketInfoCache(String adress) async {
    var prefs = await SharedPreferences.getInstance();
    return MarketInfo(
      name: prefs.getString('name$adress')!,
      messageKey: base64Decode(prefs.getString('messageKey$adress')!),
      imageLink: prefs.getString('imageLink$adress')!,
      description: prefs.getString('description$adress')!,
      operationCount: prefs.getInt('operationCount$adress')!,
      buys: [],
      sells: [],
      adress: adress,
      workTime: prefs.getString('workTime$adress')!,
      inputFee: prefs.getInt('inputFee$adress')!,
      outputFee: prefs.getInt('outputFee$adress')!,
      activeBuys: 0,
      activeSells: 0,
      delimiter: prefs.getInt('delimiter$adress')!,
    );
  }
}
