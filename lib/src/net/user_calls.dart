import 'dart:convert';

import 'package:fixnum/fixnum.dart';
import 'package:sync_tree_modile_ui/src/local/storage.dart';

import 'api.pb.dart';
import 'api.pbgrpc.dart';
import 'api.dart';

/// # ATTENTION!
/// All methods in this class return true/false values in case the call is
/// operated successfully or not. Alse they print errors, if there are some
/// of them found during execution.
class UserCalls {
  static Future<bool> create() async {
    try {
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
      return true;
    } catch (exception) {
      print(exception);
      return false;
    }
  }

  static Future<bool> update(String name) async {
    try {
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
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> send(int amount, String recieverAdress) async {
    try {
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
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> message(String marketAdress, String message) async {
    try {
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
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> buy(String marketAdress, int recieve, int offer) async {
    try {
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
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> sell(String marketAdress, int recieve, int offer) async {
    try {
      var keys = await Storage.loadKeys();
      var bytesMarketAdress = base64.decode(marketAdress);
      var sign = await keys.personal.private.signList([
        keys.personal.public.bytes,
        bytesMarketAdress,
        recieve,
        offer,
      ]);
      await userStub.sell(
        UserRequests_Sell(
          publicKey: keys.personal.public.bytes,
          adress: bytesMarketAdress,
          recieve: Int64(recieve),
          offer: Int64(offer),
          sign: sign,
        ),
      );
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> cancelTrade(String marketAdress) async {
    try {
      var keys = await Storage.loadKeys();
      var bytesMarketAdress = base64.decode(marketAdress);
      var sign = await keys.personal.private.signList([
        keys.personal.public.bytes,
        bytesMarketAdress,
      ]);
      await userStub.cancelTrade(
        UserRequests_CancelTrade(
          publicKey: keys.personal.public.bytes,
          marketAdress: bytesMarketAdress,
          sign: sign,
        ),
      );
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }
}
