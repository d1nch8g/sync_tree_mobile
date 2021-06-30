import 'dart:typed_data';

import 'package:grpc/grpc.dart';
import 'package:sync_tree_mobile/crypt.dart';

import '../api/api.pb.dart';
import '../api/api.pbgrpc.dart';
import '../api/api.dart';

class Market {
  String name;
  String description;
  String mesKey;
  int opCount;
  List<Trade> buys;
  List<Trade> sells;
  Market(
    this.name,
    this.description,
    this.mesKey,
    this.opCount,
    this.buys,
    this.sells,
  );
}

class Trade {
  int buyPrice;
  int sellPrice;
  Trade(
    this.buyPrice,
    this.sellPrice,
  );
}

Future<List<Uint8List>> searchMarketAdresses(String name) async {
  try {
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
  } catch (Exception) {
    return [];
  }
}

Future<Market> getMarketInformation(Uint8List adress) async {
  final response = await stub.infoMarket(
    InfoMarketRequest(
      adress: adress,
    ),
    options: CallOptions(
      timeout: Duration(milliseconds: 2584),
    ),
  );
  var mesKey = Crypt().bytesToPublic(
    Uint8List.fromList(response.mesKey),
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
    response.name,
    response.descr,
    mesKey,
    response.opCount.toInt(),
    buys,
    sells,
  );
}
