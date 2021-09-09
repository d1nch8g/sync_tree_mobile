import 'package:shared_preferences/shared_preferences.dart';

enum StorageKey {
  privateKey,
  publicKey,
  privateMesKey,
  publicMesKey,
  password,
  mainBalance,
  connectedWallets,
  searchCache,
  publicName,
}

final mapping = {
  StorageKey.privateKey: "privateKey",
  StorageKey.publicKey: "publicKey",
  StorageKey.privateMesKey: "privateMesKey",
  StorageKey.publicMesKey: "publicMesKey",
  StorageKey.password: "password",
  StorageKey.mainBalance: "mainBalance",
  StorageKey.connectedWallets: "connectedWallets",
  StorageKey.searchCache: "searchCache",
  StorageKey.publicName: "publicName",
};

void saveValue(StorageKey key, String value) async {
  var prefs = await SharedPreferences.getInstance();
  prefs.setString(mapping[key] ?? '', value);
}

Future<String> loadValue(StorageKey key) async {
  var prefs = await SharedPreferences.getInstance();
  print(prefs.getString(mapping[key] ?? ''));
  return prefs.getString(mapping[key] ?? '') ?? '';
}

String loadValueSync(StorageKey value) {
  var returnValue = '';
  SharedPreferences.getInstance().then(
    (prefs) => {
      returnValue = prefs.getString(mapping[value] ?? '') ?? '',
    },
  );
  return returnValue;
}
