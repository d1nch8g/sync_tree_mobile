import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sync_tree_mobile_logic/src.dart';

import 'test_data.dart';

void main() {
  test('info has trades', () async {
    SharedPreferences.setMockInitialValues({
      'keys': alcoholKeys,
      'publicName': 'Alcohol',
      'balance': 10,
    });
    var hasTrades = await InfoCalls.selfActiveTradesByAdress(testMarketAdress);
    if (hasTrades != false) {
      fail('there should not be any trades on that adress');
    }
  });
  test('info market', () async {
    var marketInfo = await InfoCalls.marketInfo(
      base64.decode(testMarketAdress),
    );
    if (marketInfo.name != 'Bitcoin Ftem') {
      fail('the name of that market should be bitcoin ftem');
    }
  });
  test('info search', () async {
    var foundMarkets = await InfoCalls.searchMarkets('ftem');
    if (foundMarkets.length != 2) {
      fail('the length of found markets should be equal to 2');
    }
  });
  test('info user', () async {
    var userInfo = await InfoCalls.userInfo(testAlcoholAdress);
    if (userInfo.name != 'Alcohol') {
      fail('user name should be equal to Alcohol, not ${userInfo.name}');
    }
  });
  test('info messages', () async {
    SharedPreferences.setMockInitialValues({
      'keys': nicotinKeys,
    });
    var messages = await InfoCalls.messages(base64.decode(testMarketAdress));
    if (messages.length != 0) {
      fail('there should not be any messages on that user');
    }
  });
}
