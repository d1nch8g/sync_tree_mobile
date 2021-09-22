import 'dart:convert';

import 'package:fixnum/fixnum.dart';
import 'package:sync_tree_mobile_logic/local/storage.dart';
import 'package:sync_tree_mobile_logic/net/info_calls.dart';
import 'api.pb.dart';
import 'api.pbgrpc.dart';
import 'api.dart';

/// # Those methods are not changing anything in local storage! They only
/// throw an error in case of network fail operation
class UserCalls {
  static Future create() async {
    var publicName = await Storage.loadPublicName();
    var keys = await Storage.loadKeys();
    var sign = await keys.personal.private.signList([
      keys.personal.public.bytes,
      keys.message.public.bytes,
      publicName,
    ]);
    await userStub.create(
      UserRequests_Create(
        publicKey: keys.personal.public.bytes,
        messsageKey: keys.message.public.bytes,
        publicName: publicName,
        sign: sign,
      ),
    );
  }

  static Future update(String name) async {
    var keys = await Storage.loadKeys();
    var sign = await keys.personal.private.signList([
      keys.personal.public.bytes,
      keys.message.public.bytes,
      name,
    ]);
    await userStub.update(
      UserRequests_Update(
        publicKey: keys.personal.public.bytes,
        messsageKey: keys.message.public.bytes,
        publicName: name,
        sign: sign,
      ),
    );
  }

  static Future send(int amount, String recieverAdress) async {
    var keys = await Storage.loadKeys();
    var adressBytes = base64.decode(recieverAdress);
    var sign = await keys.personal.private.signList([
      keys.personal.public.bytes,
      amount,
      adressBytes,
    ]);
    await userStub.send(
      UserRequests_Send(
        publicKey: keys.personal.public.bytes,
        sendAmount: Int64(amount),
        recieverAdress: adressBytes,
        sign: sign,
      ),
    );
  }

  static Future message(String marketAdress, String message) async {
    var keys = await Storage.loadKeys();
    var bytesMarketAdress = base64.decode(marketAdress);
    var sign = await keys.personal.private.signList([
      keys.personal.public.bytes,
      bytesMarketAdress,
      message,
    ]);
    await userStub.message(
      UserRequests_Message(
        publicKey: keys.personal.public.bytes,
        adress: bytesMarketAdress,
        message: message,
        sign: sign,
      ),
    );
  }

  static Future buy(String marketAdress, int recieve, int offer) async {
    var keys = await Storage.loadKeys();
    var bytesMarketAdress = base64.decode(marketAdress);
    var sign = await keys.personal.private.signList([
      keys.personal.public.bytes,
      bytesMarketAdress,
      recieve,
      offer,
    ]);
    await userStub.buy(
      UserRequests_Buy(
        publicKey: keys.personal.public.bytes,
        adress: bytesMarketAdress,
        recieve: Int64(recieve),
        offer: Int64(offer),
        sign: sign,
      ),
    );
  }

  static Future<bool> sell(String marketAdress, int recieve, int offer) async {
    var keys = await Storage.loadKeys();
    var bytesMarketAdress = base64.decode(marketAdress);
    var sign = await keys.personal.private.signList([
      keys.personal.public.bytes,
      bytesMarketAdress,
      recieve,
      offer,
    ]);
    final response = await stub.userSell(
      UserSellRequest(
        publicKey: keys.personal.public.bytes,
        adress: bytesMarketAdress,
        recieve: Int64(recieve),
        offer: Int64(offer),
        sign: sign,
      ),
    );
    return response.passed;
  }

  static Future<bool> cancelTrade(String marketAdress) async {
    var keys = await Storage.loadKeys();
    var bytesMarketAdress = base64.decode(marketAdress);
    var sign = await keys.personal.private.signList([
      keys.personal.public.bytes,
      bytesMarketAdress,
    ]);
    final response = await stub.userCancelTrade(
      UserCancelTradeRequest(
        publicKey: keys.personal.public.bytes,
        marketAdress: bytesMarketAdress,
        sign: sign,
      ),
    );
    return response.passed;
  }

  static void updateSelfInformation() async {
    var firstLaunch = await Storage.checkIfFirstLaunch();
    if (!firstLaunch) {
      var keys = await Storage.loadKeys();
      try {
        var selfInfo = await InfoCalls.userInfo(
          keys.personal.public.getAdressBase64(),
        );
        Storage.saveMainBalance(selfInfo.balance);
        Storage.savePublicName(selfInfo.name);
        selfInfo.marketBalances.forEach((marketBalance) {
          Storage.saveMarketBalanceByAdress(
            base64.encode(marketBalance.adress),
            marketBalance.balance,
          );
        });
      } catch (e) {}
    }
  }
}
