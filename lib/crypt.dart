import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:pointycastle/key_generators/rsa_key_generator.dart';
import 'package:pointycastle/pointycastle.dart';
import 'dart:typed_data';
import 'package:basic_utils/basic_utils.dart';
import 'package:pointycastle/random/fortuna_random.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Crypt {
  

  Uint8List signMessage(String privKey, Uint8List data) {
    var key = CryptoUtils.rsaPrivateKeyFromPemPkcs1(privKey);
    var sign = CryptoUtils.rsaSign(key, data, algorithmName: 'SHA-512/RSA');
    return sign;
  }

  Uint8List hash(Uint8List data) {
    return Digest('SHA-512').process(data);
  }

  Future<String> getPersonalAdress() async {
    var prefs = await SharedPreferences.getInstance();
    var persPub = prefs.getString('persPub')!;
    var persPubBytes = keyToBytes(persPub);
    var adress = hash(persPubBytes);
    return base64.encode(adress);
  }

  Future<String> encrypt(String message, String publicKey) async {
    var key = CryptoUtils.rsaPublicKeyFromPemPkcs1(publicKey);
    var encrypted = CryptoUtils.rsaEncrypt(message, key);
    return encrypted;
  }

  Future<String> decrypt(String encrypted, String privateKey) async {
    var key = CryptoUtils.rsaPrivateKeyFromPemPkcs1(privateKey);
    var decrypted = CryptoUtils.rsaDecrypt(encrypted, key);
    return decrypted;
  }
}
