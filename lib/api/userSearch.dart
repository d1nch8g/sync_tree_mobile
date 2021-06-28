import 'dart:typed_data';

import 'package:grpc/grpc.dart';

import '../api/api.pb.dart';
import '../api/api.pbgrpc.dart';
import '../api/api.dart';

Future<List<Map<MarketInfo, String>>> userSearch(String name) async {
  try {
    final response = await stub.infoFind(
      InfoFindRequest(
        info: name,
      ),
      options: CallOptions(
        timeout: Duration(milliseconds: 2584),
      ),
    );
    var adresses = response.concMarkets;
    List<Map<MarketInfo, String>> finalList = [];

    for (var i = 0; i < adresses.length / 64; i++) {
      var start = i * 64;
      var singleAdress = adresses.sublist(start, start + 64);
      print(singleAdress);
      var resp = await stub.infoMarket(
        InfoMarketRequest(
          adress: singleAdress,
        ),
      );
      finalList.add({
        MarketInfo.description: resp.descr,
        MarketInfo.imgLink: resp.img,
        MarketInfo.mesKey: resp.messsageKey.toString(),
        MarketInfo.name: resp.name,
        MarketInfo.opCount: resp.opCount.toString(),
      });
    }
    return finalList;
  } catch (Exception) {
    return [];
  }
}

enum MarketInfo {
  name,
  description,
  imgLink,
  mesKey,
  opCount,
}
