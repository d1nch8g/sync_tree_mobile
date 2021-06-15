import 'dart:math';

import 'package:pointycastle/key_generators/rsa_key_generator.dart';
import 'package:pointycastle/pointycastle.dart';
import 'dart:typed_data';
import 'package:basic_utils/basic_utils.dart';
import 'package:pointycastle/random/fortuna_random.dart';

class Crypt {
  List<String> _keys({int bitLength = 2048}) {
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

  List<String> generateKeys() {
    var persKeys = _keys(bitLength: 4096);
    var mesKeys = _keys(bitLength: 2048);
    return [
      persKeys[0],
      persKeys[1],
      mesKeys[0],
      mesKeys[1],
    ];
  }

}
