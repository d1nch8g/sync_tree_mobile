import 'dart:convert';
import 'dart:typed_data';

import 'package:pointycastle/pointycastle.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:sync_tree_mobile/_local/storage.dart';

import '../_local/keys.dart';

Uint8List intToBytes(int value) {
  return Uint8List(8)..buffer.asByteData().setInt64(0, value, Endian.big);
}

Uint8List hash(Uint8List data) {
  return Digest('SHA-512').process(data);
}

Uint8List signData(String privKey, Uint8List data) {
  var key = CryptoUtils.rsaPrivateKeyFromPemPkcs1(privKey);
  var sign = CryptoUtils.rsaSign(key, data, algorithmName: 'SHA-512/RSA');
  return sign;
}

Uint8List signArrayConcatenation(List<dynamic> values) {
  /// working with strings, bytes and integers
  Uint8List byteArray = Uint8List.fromList([]);
  values.forEach((singleListValue) {
    if (singleListValue is String) {
      var stringAsBytes = singleListValue.codeUnits;
      stringAsBytes.forEach((byte) {
        byteArray.add(byte);
      });
    }
    if (singleListValue is Uint8List) {
      singleListValue.forEach((byte) {
        byteArray.add(byte);
      });
    }
    if (singleListValue is int) {
      Uint8List intAsBytes = intToBytes(singleListValue);
      intAsBytes.forEach((byte) {
        byteArray.add(byte);
      });
    }
  });
  return byteArray;
}

Future<String> getPersonalAdress() async {
  var value = await loadValue(StorageKey.publicKey);
  var persPubBytes = keyToBytes(value);
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
