import 'package:ffi/ffi.dart';
import 'dart:ffi';
import 'package:ffi/src/utf8.dart';

DynamicLibrary _lib = DynamicLibrary.open('assets/crypto_assistant.so');

typedef GenerateKeys = Pointer<Utf8> Function();
typedef GenerateKeysFunc = Pointer<Utf8> Function();
final GenerateKeys _generateKeys =
    _lib.lookup<NativeFunction<GenerateKeysFunc>>('GenerateKeys').asFunction();

typedef GetHash = Pointer<Utf8> Function(Pointer<Utf8> str);
typedef GetHashFunc = Pointer<Utf8> Function(Pointer<Utf8> str);
final GetHash _getHash =
    _lib.lookup<NativeFunction<GetHashFunc>>('GetHash').asFunction();

typedef Encrypt = Pointer<Utf8> Function(
    Pointer<Utf8> message, Pointer<Utf8> publicPem);
typedef EncryptFunc = Pointer<Utf8> Function(
    Pointer<Utf8> message, Pointer<Utf8> publicPem);
final Encrypt _encrypt =
    _lib.lookup<NativeFunction<EncryptFunc>>('Encrypt').asFunction();

typedef Decrypt = Pointer<Utf8> Function(
    Pointer<Utf8> message, Pointer<Utf8> privatePem);
typedef DecryptFunc = Pointer<Utf8> Function(
    Pointer<Utf8> message, Pointer<Utf8> privatePem);
final Decrypt _decrypt =
    _lib.lookup<NativeFunction<DecryptFunc>>('Decrypt').asFunction();

class CryptoAssistant {
  List<String> generateKeys() {
    var keys = _generateKeys().toDartString();
    var privateKey = keys.split('|')[0];
    var publicKey = keys.split('|')[1];
    return [privateKey, publicKey];
  }

  String getHash(String message) {
    var hashGoBase64 = _getHash(message.toNativeUtf8());
    return hashGoBase64.toDartString();
  }

  String encrypt(String message, String publicKey) {
    var encryptedMessage = _encrypt(
      message.toNativeUtf8(),
      publicKey.toNativeUtf8(),
    ).toDartString();
    return encryptedMessage;
  }

  String decrypt(String cryptedMessage, String privateKey) {
    var decryptedMessage = _decrypt(
      cryptedMessage.toNativeUtf8(),
      privateKey.toNativeUtf8(),
    ).toDartString();
    return decryptedMessage;
  }
}
