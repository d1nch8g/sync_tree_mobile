import 'dart:convert';
import 'dart:ffi';
import 'package:ffi/ffi.dart';

DynamicLibrary dynamic_c_lib = DynamicLibrary.open('assets/lib.so');

typedef Hash = Pointer<Utf8> Function(Pointer<Utf8>);
typedef HashFunc = Pointer<Utf8> Function(Pointer<Utf8>);
final Hash hashFFI =
    dynamic_c_lib.lookup<NativeFunction<HashFunc>>('Hash').asFunction();

typedef Sign = Pointer<Utf8> Function(Pointer<Utf8>);
typedef SignFunc = Pointer<Utf8> Function(Pointer<Utf8>);
final Sign signFFI =
    dynamic_c_lib.lookup<NativeFunction<SignFunc>>('Sign').asFunction();

typedef Keys = Pointer<Utf8> Function();
typedef KeysFunc = Pointer<Utf8> Function();
final Keys keysFFI =
    dynamic_c_lib.lookup<NativeFunction<KeysFunc>>('Keys').asFunction();

class Crypt {
  String hash(String message) {
    return hashFFI(message.toNativeUtf8()).toDartString();
  }

  // than add function to rebuild the message to list of bytes
  String sign(String message, String key) {
    // add this function over here
    var unifiedMessage = base64.encode(utf8.encode(message)) + '|' + key;
    return signFFI(unifiedMessage.toNativeUtf8()).toDartString();
  }

  List<String> keys() {
    // first - personal private
    // second - personal public
    // third - message private
    // fourth - message public
    return keysFFI().toDartString().split('|');
  }
}
