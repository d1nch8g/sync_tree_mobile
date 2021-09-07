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
      tradeList.add(SingleTrade(
        buys[i] * 2,
        buys[i] * 2 + 1,
      ));
    }
    return tradeList;
  }

  List<SingleTrade> getAllSells() {
    List<SingleTrade> tradeList = [];
    for (var i = 0; i < sells.length / 2; i++) {
      tradeList.add(SingleTrade(
        sells[i] * 2,
        sells[i] * 2 + 1,
      ));
    }
    return tradeList;
  }
}

Future<bool> infoHasTrades(List<int> userAdress, List<int> marketAdress) async {
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
