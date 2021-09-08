import 'package:shared_preferences/shared_preferences.dart';

enum StorageValues {
  privateKey,
  publicKey,
  privateMesKey,
  publicMesKey,
  firstLaunch,
  password,
  mainBalance,
  connectedWallets,
  searchCache,
}


void savePrivateKey(String privateKey) async {
  var prefs = await SharedPreferences.getInstance();
  prefs.setString('privateKey', privateKey);
}

Future<String> getPrivateKey() async {
  var prefs = await SharedPreferences.getInstance();
  return prefs.getString('privateKey')!;
}

void savePublicKey(String publicKey) async {
  var prefs = await SharedPreferences.getInstance();
  prefs.setString('publicKey', publicKey);
}

Future<String> getPublicKey() async {
  var prefs = await SharedPreferences.getInstance();
  return prefs.getString('publicKey')!;
}
