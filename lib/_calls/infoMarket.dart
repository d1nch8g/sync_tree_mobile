import 'dart:typed_data';

import 'package:grpc/grpc.dart';

import '../_api/api.pb.dart';
import '../_api/api.pbgrpc.dart';
import '../_api/api.dart';

class Market {
  Uint8List adress;
  String name;
  String description;
  String mesKey;
  String img;
  int opCount;
  List<Trade> buys;
  List<Trade> sells;
  Market(
    this.adress,
    this.name,
    this.description,
    this.mesKey,
    this.img,
    this.opCount,
    this.buys,
    this.sells,
  );
}

class Trade {
  int offer;
  int recieve;
  Trade(
    this.offer,
    this.recieve,
  );
}

Future<List<Uint8List>> searchMarketAdresses(context, String name) async {
  var stub = getStub(context);
  final response = await stub.infoSearch(
    InfoSearchRequest(
      info: name,
    ),
    options: CallOptions(
      timeout: Duration(milliseconds: 2584),
    ),
  );
  List<Uint8List> markets = [];
  for (var i = 0; i < response.concMarkets.length; i++) {
    markets.add(Uint8List.fromList(response.concMarkets[i]));
  }
  return markets;
}

Future<Market> getMarketInformation(context, Uint8List adress) async {
  var stub = getStub(context);
  final response = await stub.infoMarket(
    InfoMarketRequest(
      adress: adress,
    ),
    options: CallOptions(
      timeout: Duration(milliseconds: 2584),
    ),
  );
  List<Trade> buys = [];
  for (var i = 0; i < response.buys.length / 2; i++) {
    buys.add(Trade(
      response.buys[i].toInt(),
      response.buys[i + 1].toInt(),
    ));
  }
  List<Trade> sells = [];
  for (var i = 0; i < response.sells.length / 2; i++) {
    buys.add(Trade(
      response.sells[i].toInt(),
      response.sells[i + 1].toInt(),
    ));
  }
  return Market(
    adress,
    response.name,
    response.descr,
    response.mesKey.toString(),
    response.img,
    response.opCount.toInt(),
    buys,
    sells,
  );
}
