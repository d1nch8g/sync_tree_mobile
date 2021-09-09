import 'package:sync_tree_mobile/_local/crypto.dart';
import 'package:sync_tree_mobile/_local/storage.dart';
import 'package:sync_tree_mobile/_net/info_calls.dart';

Future<String> updateName() async {
  var adress = await getPersonalAdressBytes();
  var userInfo = await infoUser(adress);
  saveValue(StorageKey.publicName, userInfo.name);
  return userInfo.name;
}

