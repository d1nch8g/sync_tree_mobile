import 'dart:typed_data';

import 'package:grpc/grpc.dart';
import '../_net/api.pb.dart';
import '../_net/api.pbgrpc.dart';
import '../_net/api.dart';

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
  MarketInfo(
    this.name,
    this.messageKey,
    this.imageLink,
    this.description,
    this.operationCount,
    this.buys,
    this.sells,
  );

  List<SingleTrade> getAllBuys() {
    List<SingleTrade> tradeList = [];
    for (var i = 0; i < buys.length / 2; i++) {
      tradeList.add(
        SingleTrade(
          buys[i] * 2,
          buys[i] * 2 + 1,
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
          sells[i] * 2,
          sells[i] * 2 + 1,
        ),
      );
    }
    return tradeList;
  }
}

Future<bool> infoHasTrades(
  Uint8List userAdress,
  Uint8List marketAdress,
) async {
  final response = await stub.infoHasTrades(
    InfoHasTradesRequest(
      userAdress: userAdress,
      marketAdress: marketAdress,
    ),
    options: CallOptions(
      timeout: Duration(milliseconds: 2584),
    ),
  );
  return response.passed;
}

Future<MarketInfo> infoMarket(Uint8List marketAdress) async {
  final response = await stub.infoMarket(
    InfoMarketRequest(
      adress: marketAdress,
    ),
  );
  List<int> buys = [];
  List<int> sells = [];
  for (var i = 0; i < response.buys.length; i++) {
    buys.add(response.buys[i] as int);
  }
  for (var i = 0; i < response.sells.length; i++) {
    sells.add(response.sells[i] as int);
  }
  final MarketInfo marketInfo = MarketInfo(
    response.name,
    response.mesKey,
    response.img,
    response.descr,
    response.opCount as int,
    buys,
    sells,
  );
  return marketInfo;
}

Future<List<Uint8List>> infoSearch(String info) async {
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

Future<UserInfo> infoUser(Uint8List userAdress) async {
  final response = await stub.infoUser(
    InfoUserRequest(
      adress: userAdress,
    ),
  );
  List<MarketBalance> balances = [];
  for (var i = 0; i < response.marketAdresses.length; i++) {
    balances.add(
      MarketBalance(
        response.marketAdresses[i] as Uint8List,
        response.marketBalances[i] as int,
      ),
    );
  }
  return UserInfo(
    response.publicName,
    response.balance as int,
    response.mesKey as Uint8List,
    balances,
  );
}

class Message {
  String marketName;
  String message;
  Message(
    this.marketName,
    this.message,
  );
}

Future<List<Message>> 
