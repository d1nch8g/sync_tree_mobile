import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:sync_tree_modile_ui/src/src.dart';

final testKey = '''-----BEGIN RSA PRIVATE KEY-----
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
-----END RSA PRIVATE KEY-----|-----BEGIN RSA PUBLIC KEY-----
MIICCgKCAgEAhUXHmg6f7DdeYeqjEczFq7TzDSJvWFeZ0AppJC9UXAa6ZC/qiAew
XEndgadbsCdSGCbYqAeUiUJ13JarH5dBsZSMAIXzQRjaLehfNEGgXlHPpmqttsmh
A58QKGb8u5UbGa6ucqNJndtPuBpXb9UqJnJbf6npcO3B7S4/ir6bvySwXPySHAQl
ItF7QeGwyoF9kPOhB5FBpBbGUEQLMAvQCIJLAt0SA0TAveXtItSEDpVm7ryVVFmN
hrHd+IDRH/D9X5Vf8bw+hJTF/d5yza3/8nb7ecR98gaPw7Fu1rr5qj3uR9qWbPyJ
r4eXMlV8dUs6mio3inbMOuSJF/PmZVt/7RfMutzL/LtSKsq3H1l6oIwL7wODkScc
CFXMrG/w2KmoeIk6UUs0ZUqQ21peH+tX3lO8XGzWhliOAN+g2B3/Qsp85roLP7kg
ndys2E/ebmrZsPtJbNKV4tmptxdVIHjdqPgbS3X+txw8Wre1Qp4FTHTeUttXeLf0
lHhVKGnnsbwK9fU7BySHvHlZ8hqtUxaJxZ8JfCfRLS8Uq1o8eaQa/PTy8o0oVhlb
shOjSdULb4prGfiXBzQzMAaTT6/3eFkbP6lR76t0WKecPQvRTkTSf+5pdS5hvCuj
rxBrjHJIaxAMgdMbALW/A7IyjOjaMpPw+buMeg32jKl3mwF+mrJ/84MCAwEAAQ==
-----END RSA PUBLIC KEY-----|-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAhzFjijjlGXGRqQjdSJbRFU2+Sr7uVzLpS4sA4Lxjhk+FEyX0
YHwZeFKyAYQ7XcC6SAlo4fztm9tmkFaSB9NhwXE+qoL5PZJEnC8NEup+cue7lome
V/CPo3gnbI/EetfK2V+uJKuRAZCwGCDs/6zVqEolJsBVnd/7ouJASBuf5GaeZDp3
VJpH1BjrDp73FegFfA9WyMzsni9wrfhf3ZKNQha3FsPgzE/LTDe0zTnlNDYTjYGF
9KhlLZNPvu2a1GXXBZAjK+K2uVamdATF5EofhTh0Mk44dZlicEMLDEdcYVzANs34
6CnylRklcGJo1HNFJVOzTVq8kcYiEWU3teU4pwIDAQABAoIBABp0vs74zVSKVf/n
PS6MXQQ3P4rvDENCMkdXP2e7VhqdiyQxJD6RaoaSYEVNtDRnl8yrErxOu8zpRYvv
dQpVAmdRmvrRQKcc7ZJG3t8Zxn8D/EC8U6FP8TwDMmvbQo7rlcWuJK0Gag0NXHiM
UPTDxNf3Eogf0WFgyKSadAvoZATVCyEsbymQ7VtSJrcRwzioqehixoALaLfQpPaY
2+L4JyH+IEFVMLFYd730fGyLCupNKNdsR75eJDxh7WKs5yjefn7SKO7DJJIYXQvb
GyYbWuzSFJQjGMYU5pPXSOnOoo53pTIzzlnqSrGeZE0YQabtv9ofzJB1dJBPnuzZ
gPI2O/kCgYEAx7VT87PuPXMSpb22UCYKKDtnsbstjx+7JWMTjcjh+O6ABSMRasTF
p5p/ozjJHV1RWy9aylTAL2safVpr2uYiNPbYOzJsMlpi1DRRIPVScuAAYqecw3QY
b47uF/w2GWFNGZX8meqKmMeKkkoIFRWziEOgEEGQG2seO4Go3WGyFjMCgYEArUy4
jqVmqFhzegxz9EcJ6CuVFVFKy4307WQgyze4dkMn06MQ0PYM8TRRwssLaNFxTYE9
hmpk1aMM0UNEF+xlD3o8O42DJU/Sw1VldPaAr6fvANR+24/fRXbNep29YNcEa2gr
H+tingLzcHzfaYnxr0VQarsb1JhevSIKmqYi170CgYBkcmSmZ/LFP5K6gGApkeh7
8d0m/NFecoRLuriEEOzvqu4DJ29EN3J+6WuXaiFlvqED7x6IM/ZyIzmwoQEsmaHM
5/c8VxEqhmG9AA9qN1nf46Dt/gYQHN2Jhudkcvu26kTAQLtLozdQvtSI3emQyViC
ihkA9CkKUWdkYMPRjajoFwKBgAoSeHOJ93J3WZbRXHfpHRFKXyrTA7ba9E5L0IAf
J/BvrMPnKVYLxurJ8KqSpIIeEijABzRlwKCODnOnJjEBw0nn/9IyQloLzqMdtnza
ytXqu8BfmVPng8GEyyKCQnx7Yr1fW4pKYvvuDfoOt+lpZAucyrS5VT/A71isvtMI
LuQ9AoGARGIZkf8Z6mPsSfpPWLjyEXwn45ODwKHufLebYeZs0mHKYpux+ycjcPkz
oeoxNn7i4TX3g33wBC5QPpDTUxR+8qolNuyUmvoKJRy7Rk+6LsExQu1nNJpPGFv2
lmbjyNX2/HCQwly5cU5nWO6XxEQ0N8TD7Ry3iW6a2lafItpjb0o=
-----END RSA PRIVATE KEY-----|-----BEGIN RSA PUBLIC KEY-----
MIIBCgKCAQEAhzFjijjlGXGRqQjdSJbRFU2+Sr7uVzLpS4sA4Lxjhk+FEyX0YHwZ
eFKyAYQ7XcC6SAlo4fztm9tmkFaSB9NhwXE+qoL5PZJEnC8NEup+cue7lomeV/CP
o3gnbI/EetfK2V+uJKuRAZCwGCDs/6zVqEolJsBVnd/7ouJASBuf5GaeZDp3VJpH
1BjrDp73FegFfA9WyMzsni9wrfhf3ZKNQha3FsPgzE/LTDe0zTnlNDYTjYGF9Khl
LZNPvu2a1GXXBZAjK+K2uVamdATF5EofhTh0Mk44dZlicEMLDEdcYVzANs346Cny
lRklcGJo1HNFJVOzTVq8kcYiEWU3teU4pwIDAQAB
-----END RSA PUBLIC KEY-----''';
void main() {
  test('generate key band', () async {
    var keys = Keys.generate();
    if (keys.message.private.pem.length < 100 ||
        keys.message.public.pem.length < 100 ||
        keys.personal.private.pem.length < 100 ||
        keys.personal.public.pem.length < 100) {
      fail('something is not generated correctly');
    }
  });
  test('private key from bytes test', () async {
    var band = Keys.fromSingleString(multiKeyStirng: testKey);
    var priv = PrivateKey.fromBytes(bytes: band.message.private.bytes);
    if (priv.pem.length < 50) {
      fail('failed to convert bytes to private key');
    }
  });
  test('private key from pem', () async {
    var band = Keys.fromSingleString(multiKeyStirng: testKey);
    var priv = PrivateKey.fromPEM(pem: band.message.private.pem);
    if (priv.bytes.length < 50) {
      fail('failed to convert pem string to private key');
    }
  });
  test('private key integer to bytes', () async {
    var band = Keys.fromSingleString(multiKeyStirng: testKey);
    var bytes = band.personal.private.intToBytes(19237);
    if (bytes[0] != 37) {
      fail('failed to convert ineger value to bytes');
    }
  });
  test('private key sign data array', () async {
    var band = Keys.fromSingleString(multiKeyStirng: testKey);
    var bytes = Uint8List.fromList([1, 2, 3, 4, 5]);
    var sign = await band.personal.private.signData(bytes);
    if (sign.length != 512) {
      fail('sign length is wrong, something is bad ${sign.length}');
    }
  });
  test('private array to bytes', () async {
    var band = Keys.fromSingleString(multiKeyStirng: testKey);
    var bytes = Uint8List.fromList([1, 2, 3, 4, 5]);
    var integer = 282;
    var string = 'alloha';
    var byteSum = band.personal.private.transformListToByteArray([
      bytes,
      integer,
      string,
    ]);
    var goodByteSum = Uint8List.fromList(
      [1, 2, 3, 4, 5, 26, 1, 0, 0, 0, 0, 0, 0, 97, 108, 108, 111, 104, 97],
    );
    if (byteSum.toString() != goodByteSum.toString()) {
      fail('something went wrong with bytesum');
    }
  });
  test('private key sign data', () async {
    var band = Keys.fromSingleString(multiKeyStirng: testKey);
    var bytesToSign = Uint8List.fromList([1, 2, 3, 4, 5, 6]);
    var sign = await band.personal.private.signList([
      bytesToSign,
      bytesToSign,
      bytesToSign,
    ]);
    if (sign.length != 512) {
      fail('sign generated incorrectly');
    }
  });
  test('public encrypt, private decrypt', () async {
    var band = Keys.fromSingleString(multiKeyStirng: testKey);
    var untouchedMessage = 'some text';
    var encryptedMessage = await band.message.public.encrypt(untouchedMessage);
    var decryptedMessage = await band.message.private.decrypt(encryptedMessage);
    if (decryptedMessage != untouchedMessage ||
        encryptedMessage == untouchedMessage) {
      fail('some error in ecnryption/decryption module');
    }
  });
  test('public key from bytes', () async {
    var band = Keys.fromSingleString(multiKeyStirng: testKey);
    var priv = PublicKey.fromBytes(bytes: band.message.public.bytes);
    if (priv.pem.length < 50) {
      fail('failed to convert bytes to public key');
    }
  });
  test('public key from pem', () async {
    var band = Keys.fromSingleString(multiKeyStirng: testKey);
    var priv = PublicKey.fromPEM(pem: band.message.public.pem);
    if (priv.bytes.length < 50) {
      fail('failed to convert pem string to public key');
    }
  });
  test('public get hash adress bytes/base64', () async {
    var band = Keys.fromSingleString(multiKeyStirng: testKey);
    var adressBase64 = band.personal.public.getAdressBase64();
    var adressBytes = band.personal.public.getAdressBytes();
    if (adressBytes.length < 50 || adressBase64.length < 50) {
      fail('key bytes converted to adress incorrectly');
    }
  });
  test('key band single string exort/import', () async {
    var keys = Keys.generate();
    var keysString = keys.allKeysString;
    var keysAgain = Keys.fromSingleString(
      multiKeyStirng: keysString,
    );
    if (keys.message.private.toString() !=
            keysAgain.message.private.toString() ||
        keys.personal.public.toString() != keys.personal.public.toString()) {
      fail('some error importing/exporting keys from/to single string line');
    }
  });
}
