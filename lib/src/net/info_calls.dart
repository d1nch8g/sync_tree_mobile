import 'dart:convert';
import 'dart:typed_data';

import 'package:sync_tree_mobile_logic/local/storage.dart';

import 'api.pb.dart';
import 'api.pbgrpc.dart';
import 'api.dart';

class MarketBalance {
  Uint8List adress;
  int balance;
  MarketBalance(
    this.adress,
    this.balance,
  );
}

class UserInfo {
  String name;
  int balance;
  Uint8List mesKey;
  List<MarketBalance> marketBalances;
  UserInfo(
    this.name,
    this.balance,
    this.mesKey,
    this.marketBalances,
  );
}

class SingleTrade {
  int offer;
  int recieve;
  SingleTrade(
    this.offer,
    this.recieve,
  );
}

class MarketInfo {
  String name;
  List<int> messageKey;
  String imageLink;
  String description;
  int operationCount;
  List<int> buys;
  List<int> sells;
  String adress;
  String workTime;
  int inputFee;
  int outputFee;
  int activeBuys;
  int activeSells;
  MarketInfo({
    required this.name,
    required this.messageKey,
    required this.imageLink,
    required this.description,
    required this.operationCount,
    required this.buys,
    required this.sells,
    required this.adress,
    required this.workTime,
    required this.inputFee,
    required this.outputFee,
    required this.activeBuys,
    required this.activeSells,
  });

  List<SingleTrade> getAllBuys() {
    List<SingleTrade> tradeList = [];
    for (var i = 0; i < buys.length / 2; i++) {
      tradeList.add(
        SingleTrade(
          buys[i * 2],
          buys[i * 2 + 1],
        ),
      );
    }
    return tradeList;
  }

  List<SingleTrade> getAllSells() {
    List<SingleTrade> tradeList = [];
    for (var i = 0; i < sells.length / 2; i++) {
      tradeList.add(
        SingleTrade(
          sells[i * 2],
          sells[i * 2 + 1],
        ),
      );
    }
    return tradeList;
  }
}

/// # ATTENTION
/// all methods called by that class can throw connection error
class InfoCalls {
  static Future<bool> selfActiveTradesByAdress(String marketAdress) async {
    var keys = await Storage.loadKeys();
    final response = await stub.infoHasTrades(
      InfoHasTradesRequest(
        userAdress: keys.personal.public.getAdressBytes(),
        marketAdress: base64.decode(marketAdress),
      ),
    );
    return response.passed;
  }

  static Future<MarketInfo> marketInfo(Uint8List marketAdress) async {
    final response = await stub.infoMarket(
      InfoMarketRequest(
        adress: marketAdress,
      ),
    );
    List<int> buys = [];
    List<int> sells = [];
    for (var i = 0; i < response.buys.length; i++) {
      buys.add(response.buys[i].toInt());
    }
    for (var i = 0; i < response.sells.length; i++) {
      sells.add(response.sells[i].toInt());
    }
    final MarketInfo marketInfo = MarketInfo(
      name: response.name,
      messageKey: response.mesKey,
      imageLink: response.img,
      description: response.descr,
      operationCount: response.opCount.toInt(),
      buys: buys,
      sells: sells,
      adress: base64.encode(marketAdress),
      workTime: response.workTime,
      inputFee: response.inputFee.toInt(),
      outputFee: response.outputFee.toInt(),
      activeBuys: response.activeBuys.toInt(),
      activeSells: response.activeSells.toInt(),
    );
    return marketInfo;
  }

  static Future<List<Uint8List>> searchMarkets(String info) async {
    final response = await stub.infoSearch(
      InfoSearchRequest(
        info: info,
      ),
    );
    List<Uint8List> markets = [];
    response.concMarkets.forEach((marketAdress) {
      markets.add(marketAdress as Uint8List);
    });
    return markets;
  }

  static Future<UserInfo> userInfo(String adress) async {
    final response = await stub.infoUser(
      InfoUserRequest(
        adress: base64.decode(adress),
      ),
    );
    List<MarketBalance> balances = [];
    for (var i = 0; i < response.marketAdresses.length; i++) {
      balances.add(
        MarketBalance(
          response.marketAdresses[i] as Uint8List,
          response.marketBalances[i].toInt(),
        ),
      );
    }
    return UserInfo(
      response.publicName,
      response.balance.toInt(),
      response.mesKey as Uint8List,
      balances,
    );
  }

  static Future<List<String>> messages(Uint8List marketAdress) async {
    var keys = await Storage.loadKeys();
    final response = await stub.infoMessages(
      InfoMessagesRequest(
        userAdress: keys.personal.public.getAdressBytes(),
        marketAdress: marketAdress,
      ),
    );
    return response.messages;
  }
}
