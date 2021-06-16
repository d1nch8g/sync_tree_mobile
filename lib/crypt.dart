import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:pointycastle/key_generators/rsa_key_generator.dart';
import 'package:pointycastle/pointycastle.dart';
import 'dart:typed_data';
import 'package:basic_utils/basic_utils.dart';
import 'package:pointycastle/random/fortuna_random.dart';

class Crypt {
  static List<String> _keys(int bitLength) {
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

  Future<List<String>> generateKeys() async {
    var persKeys = await compute(_keys, 4096);
    var mesKeys = await compute(_keys, 2048);
    return [
      persKeys[0],
      persKeys[1],
      mesKeys[0],
      mesKeys[1],
    ];
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

  bool checkPrivateKey(String key) {
    try {
      CryptoUtils.rsaPrivateKeyFromPemPkcs1(key);
      print('key is ok');
      return true;
    } catch (exc) {
      print('key is not ok');
      return false;
    }
  }

  Uint8List signMessage(String privKey, Uint8List data) {
    var key = CryptoUtils.rsaPrivateKeyFromPemPkcs1(privKey);
    var sign = CryptoUtils.rsaSign(key, data, algorithmName: 'SHA-512/RSA');
    return sign;
  }
}
