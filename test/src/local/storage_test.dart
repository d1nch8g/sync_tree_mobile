import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sync_tree_mobile_ui/src/src.dart';

void main() {
  test('storage load value', () async {
    SharedPreferences.setMockInitialValues({
      'password': 'abcdefg',
    });
    var loaded = await Storage.loadPassword();
    if (loaded != 'abcdefg') {
      fail('value loaded from prefs is not matching');
    }
  });
  test('storage check first launch', () async {
    SharedPreferences.setMockInitialValues({});
    var fl = await Storage.checkIfFirstLaunch();
    if (!fl) {
      fail('test should say that it is first launch');
    }
    Storage.firstLauchComplete();
    Future.delayed(Duration(seconds: 1), () async {
      var fl2 = await Storage.checkIfFirstLaunch();
      if (!fl2) {
        fail('test should say that it is not first launch');
      }
    });
  });
  test('add new connected wallet', () async {
    SharedPreferences.setMockInitialValues({});
    var firstAdressToConnect = "f1";
    var secondAdressToConnect = "f2";
    var wallets = await Storage.loadConnectedWallets();
    if (wallets.length != 0) {
      fail('invalid wallets lens, non of them should be currently connected');
    }
    Storage.addConnectedMarket(firstAdressToConnect);
    Future.delayed(Duration(seconds: 1), () async {
      var firstNewWallets = await Storage.loadConnectedWallets();
      if (firstNewWallets.length != 1) {
        fail('connected wallets length should be equal to 1');
      }
      if (firstNewWallets[0] != firstAdressToConnect) {
        fail('first connected wallet adress is not matching');
      }
      Storage.addConnectedMarket(secondAdressToConnect);
      Future.delayed(Duration(seconds: 1), () async {
        var secondNewWallets = await Storage.loadConnectedWallets();
        if (secondNewWallets.length != 1) {
          fail('connected wallets length should be equal to 2');
        }
        if (secondNewWallets[0] != firstAdressToConnect) {
          fail('first connected wallet adress is not matching');
        }
        if (secondNewWallets[1] != secondAdressToConnect) {
          fail('second connected wallet adress is not matching');
        }
      });
    });
  });
}
