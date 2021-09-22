import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/local/storage.dart';
import 'package:sync_tree_mobile_logic/net/api.pb.dart';

import 'api.pb.dart';
import 'api.pbgrpc.dart';
import 'api.dart';

class MarketBalance {
  Uint8List adress;
  int balance;
  MarketBalance({
    required this.adress,
    required this.balance,
  });
}

class UserInfo {
  String name;
  int balance;
  Uint8List mesKey;
  List<MarketBalance> marketBalances;
  UserInfo({
    required this.name,
    required this.balance,
    required this.mesKey,
    required this.marketBalances,
  });
}

class Trade {
  int offer;
  int recieve;
  Trade({
    required this.offer,
    required this.recieve,
  });
}

class MarketInfo {
  String name;
  List<int> messageKey;
  String imageLink;
  String description;
  int operationCount;
  List<Trade> buys;
  List<Trade> sells;
  String adress;
  String workTime;
  int inputFee;
  int outputFee;
  int activeBuys;
  int activeSells;
  int delimiter;
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
    required this.delimiter,
  });
}

/// # ATTENTION
/// all methods called by that class can throw connection error
class InfoCalls {
  static Future<UserInfo> userInfo(String adress) async {
    final response = await infoStub.user(
      InfIn_Adress(adress: base64Decode(adress)),
    );
    List<MarketBalance> balances = [];
    for (var i = 0; i < response.marketAdresses.length; i++) {
      balances.add(
        MarketBalance(
          adress: response.marketAdresses[i] as Uint8List,
          balance: response.marketBalances[i].toInt(),
        ),
      );
    }
    return UserInfo(
      name: response.publicName,
      balance: response.balance.toInt(),
      mesKey: response.messageKey as Uint8List,
      marketBalances: balances,
    );
  }

  static Future<bool> hasTrades(String marketAdress) async {
    var keys = await Storage.loadKeys();
    var response = await infoStub.hasTrades(
      InfIn_UserMarketAdresses(
        userAdress: keys.personal.public.getAdressBytes(),
        marketAdress: base64Decode(marketAdress),
      ),
    );
    return response.hasTrades;
  }

  static Future<MarketInfo> marketInfo(String marketAdress) async {
    final response = await infoStub.market(
      InfIn_Adress(adress: base64Decode(marketAdress)),
    );
    List<Trade> buys = [];
    List<Trade> sells = [];
    response.buys.forEach((buy) {
      buys.add(Trade(
        offer: buy.offer.toInt(),
        recieve: buy.recieve.toInt(),
      ));
    });
    final MarketInfo marketInfo = MarketInfo(
      adress: marketAdress,
      name: response.name,
      messageKey: response.messageKey,
      imageLink: response.imageLink,
      description: response.description,
      operationCount: response.operationCount.toInt(),
      buys: buys,
      sells: sells,
      workTime: response.workTime,
      inputFee: response.inputFee.toInt(),
      outputFee: response.outputFee.toInt(),
      activeBuys: response.activeBuys.toInt(),
      activeSells: response.activeSells.toInt(),
      delimiter: response.delimiter.toInt(),
    );
    return marketInfo;
  }

  static Future<List<String>> searchMarkets(String info) async {
    final response = await infoStub.search(
      InfIn_SearchText(text: info),
    );
    List<String> markets = [];
    response.marketAdresses.forEach((marketAdress) {
      markets.add(base64Encode(marketAdress));
    });
    return markets;
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
