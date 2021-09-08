import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:pointycastle/key_generators/rsa_key_generator.dart';
import 'package:pointycastle/pointycastle.dart';
import 'dart:typed_data';
import 'package:basic_utils/basic_utils.dart';
import 'package:pointycastle/random/fortuna_random.dart';
import 'package:sync_tree_mobile/_local/storage.dart';

List<String> generateKeyPair(int bitLength) {
  final secureRandom = FortunaRandom();
  final seedSource = Random.secure();
  final seeds = <int>[];
  for (var i = 0; i < 32; i++) {
    seeds.add(seedSource.nextInt(255));
  }
  secureRandom.seed(KeyParameter(Uint8List.fromList(seeds)));
  final keyGen = RSAKeyGenerator()
    ..init(ParametersWithRandom(
        RSAKeyGeneratorParameters(BigInt.parse('65537'), bitLength, 64),
        secureRandom));

  final pair = keyGen.generateKeyPair();
  final myPublic = pair.publicKey as RSAPublicKey;
  final myPrivate = pair.privateKey as RSAPrivateKey;
  var priv = CryptoUtils.encodeRSAPrivateKeyToPemPkcs1(myPrivate);
  var pub = CryptoUtils.encodeRSAPublicKeyToPemPkcs1(myPublic);
  return [priv, pub];
}

Future<bool> generateAndSaveKeys() async {
  var persKeys = await compute(generateKeyPair, 4096);
  var mesKeys = await compute(generateKeyPair, 2048);
  saveValue(StorageValue.privateKey, persKeys[0]);
  saveValue(StorageValue.publicKey, persKeys[1]);
  saveValue(StorageValue.privateMesKey, mesKeys[0]);
  saveValue(StorageValue.publicMesKey, mesKeys[1]);
  return true;
}

Uint8List keyToBytes(String key) {
  return CryptoUtils.getBytesFromPEMString(key);
}

String bytesToPrivate(Uint8List bytes) {
  var key = CryptoUtils.rsaPrivateKeyFromDERBytesPkcs1(bytes);
  return CryptoUtils.encodeRSAPrivateKeyToPemPkcs1(key);
}

String bytesToPublic(Uint8List bytes) {
  var key = CryptoUtils.rsaPublicKeyFromDERBytesPkcs1(bytes);
  return CryptoUtils.encodeRSAPublicKeyToPemPkcs1(key);
}

Future<String> exportKeysAsString() async {
  var keys = await getAllKeys();
  var singleString = (get! +
      '|' +
      keys[Key.PersonalPublicKey]! +
      '|' +
      keys[Key.MessagePrivateKey]! +
      '|' +
      keys[Key.MessagePublicKey]!);
  return singleString;
}

void importKeysFromString(String singleKeyString) {
  var allKeysList = singleKeyString.split('|');
  var keys = {
    Key.PersonalPrivateKey: allKeysList[0],
    Key.PersonalPublicKey: allKeysList[1],
    Key.MessagePrivateKey: allKeysList[2],
    Key.MessagePublicKey: allKeysList[3],
  };
  saveAllKeys(keys);
}

bool checkAllKeys(String keys) {
  var allKeys = keys.split('|');
  try {
    CryptoUtils.rsaPrivateKeyFromPemPkcs1(allKeys[0]);
    CryptoUtils.rsaPrivateKeyFromPemPkcs1(allKeys[2]);
    CryptoUtils.rsaPublicKeyFromPemPkcs1(allKeys[1]);
    CryptoUtils.rsaPublicKeyFromPemPkcs1(allKeys[3]);
    return true;
  } catch (exc) {
    return false;
  }
}
