import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../src/src.dart';

void main() {
  test('Storage save value', () async {
    SharedPreferences.setMockInitialValues({});

    Storage.savePassword('abcdefg');
  });
  test('storage load value', () async {
    SharedPreferences.setMockInitialValues({
      'password': 'abcdefg',
    });

    var loaded = await Storage.loadPassword();
    if (loaded != 'abcdefg') {
      fail('value loaded from prefs is not matching');
    }
  });
  test('stream trigger event', () {
    Storage.triggerStorageEvent(
      trigger: Trigger.mainBalanceUpdate,
    );
  });
  test('stream function triggering test', () async {
    var valueToBeChanged = 1;
    var valueChanger = () {
      valueToBeChanged = 2;
    };
    Storage.createTriggerSubscription(
      trigger: Trigger.mainBalanceUpdate,
      onTriggerEvent: valueChanger,
    );
    Storage.triggerStorageEvent(
      trigger: Trigger.mainBalanceUpdate,
    );
    Future.delayed(Duration(seconds: 1), () {
      if (valueToBeChanged != 2) {
        fail('the value that needs to be changed is the same');
      }
    });
  });
}
