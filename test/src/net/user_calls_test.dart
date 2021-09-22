import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../src/src.dart';

import 'test_data.dart';

setAlcoParameters() {}
void main() {
  test('Create success', () async {
    var keys = Keys.generate();
    SharedPreferences.setMockInitialValues({
      'keys': keys.allKeysString,
      'name': 'holac',
    });
    var created = await UserCalls.create();
    if (!created) {
      fail('user should be created');
    }
  });
  test('Create fail', () async {
    var keys = Keys.generate();
    SharedPreferences.setMockInitialValues({
      'keys': keys.allKeysString,
      'name': 'longlonglonglonglonglonglonglonglonglonglonglongname',
    });
    var created = await UserCalls.create();
    if (created) {
      fail('user should not be created');
    }
  });
  test('Update success', () async {
    SharedPreferences.setMockInitialValues({
      'keys': alcoholKeys,
      'name': 'Alcohol',
    });
    var updated = await UserCalls.update();
    if (!updated) {
      fail('user infotmation should be updated');
    }
  });
  test('Update fail', () async {
    SharedPreferences.setMockInitialValues({
      'keys': alcoholKeys,
      'name': 'longlonglonglonglonglonglonglonglonglonglonglongname',
    });
    var updated = await UserCalls.update();
    if (updated) {
      fail('user infotmation should not be updated');
    }
  });
  test('Send success', () async {
    SharedPreferences.setMockInitialValues({
      'keys': alcoholKeys,
      'balance': 10,
    });
    var nicoKeys = Keys.fromSingleString(multiKeyStirng: nicotinKeys);
    var triggerWasTriggered = false;
    Function trigger = () {
      triggerWasTriggered = true;
    };
    Storage.createTriggerSubscription(
      trigger: Trigger.mainBalanceUpdate,
      onTriggerEvent: trigger,
    );
    var operated = await UserCalls.send(
      1,
      nicoKeys.personal.public.getAdressBase64(),
    );
    if (operated != true) {
      fail('this transaction should go well');
    }
    Future.delayed(Duration(seconds: 1), () {
      if (triggerWasTriggered == false) {
        fail('trigger should have been triggered');
      }
    });
  });
  test('Send fail', () async {
    SharedPreferences.setMockInitialValues({
      'keys': alcoholKeys,
      'balance': 100000000000,
    });
    var nicoKeys = Keys.fromSingleString(multiKeyStirng: nicotinKeys);
    var operated = await UserCalls.send(
      100000000000,
      nicoKeys.personal.public.getAdressBase64(),
    );
    if (operated) {
      fail('this transaction should not be operated $operated');
    }
  });
  test('Message success', () async {
    SharedPreferences.setMockInitialValues({
      'keys': alcoholKeys,
    });
    var operated = await UserCalls.message(testAlcoholAdress, 'hola');
    if (operated == false) {
      fail('the message is not delivered');
    }
  });
  test('Buy success', () async {
    SharedPreferences.setMockInitialValues({
      'keys': alcoholKeys,
    });
    await UserCalls.cancelTrade(base64Encode(dummyMarketAdress1));
    var operated = await UserCalls.buy(
      base64Encode(dummyMarketAdress1),
      10,
      10,
    );
    if (!operated) {
      fail('this trade should be operated');
    }
  });
  test('Buy fail', () async {
    SharedPreferences.setMockInitialValues({
      'keys': alcoholKeys,
    });
    var operated = await UserCalls.buy(
      base64Encode(dummyMarketAdress1),
      10,
      10000000000,
    );
    if (operated) {
      fail('this trade should not be operated');
    }
  });
  test('Sell success', () async {
    SharedPreferences.setMockInitialValues({
      'keys': alcoholKeys,
    });
    await UserCalls.cancelTrade(base64Encode(dummyMarketAdress1));
    var operated = await UserCalls.sell(
      base64Encode(dummyMarketAdress1),
      10,
      10,
    );
    if (!operated) {
      fail('this trade should be operated');
    }
  });
  test('Sell fail', () async {
    // errre find
    SharedPreferences.setMockInitialValues({
      'keys': alcoholKeys,
    });
    var operated = await UserCalls.sell(
      base64Encode(dummyMarketAdress1),
      10,
      1000000000000,
    );
    if (operated) {
      fail('this trade should not be operated');
    }
  });
  test('CancelTrade success', () async {
    SharedPreferences.setMockInitialValues({
      'keys': alcoholKeys,
    });
    var cancelled = await UserCalls.cancelTrade(
      base64Encode(dummyMarketAdress1),
    );
    if (!cancelled) {
      fail('trades not cancelled');
    }
  });
}
