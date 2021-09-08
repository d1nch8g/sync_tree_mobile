import 'package:shared_preferences/shared_preferences.dart';

enum StorageValue {
  privateKey,
  publicKey,
  privateMesKey,
  publicMesKey,
  password,
  mainBalance,
  connectedWallets,
  searchCache,
}

final mapping = {
  StorageValue.privateKey: "privateKey",
  StorageValue.publicKey: "publicKey",
  StorageValue.privateMesKey: "privateMesKey",
  StorageValue.publicMesKey: "publicMesKey",
  StorageValue.password: "password",
  StorageValue.mainBalance: "mainBalance",
  StorageValue.connectedWallets: "connectedWallets",
  StorageValue.searchCache: "searchCache",
};

void saveValue(StorageValue key, String value) async {
  var prefs = await SharedPreferences.getInstance();
  prefs.setString(mapping[key] ?? '', value);
}

Future<String> getStoredValue(StorageValue value) async {
  var prefs = await SharedPreferences.getInstance();
  return prefs.getString(mapping[value] ?? '') ?? '';
}
