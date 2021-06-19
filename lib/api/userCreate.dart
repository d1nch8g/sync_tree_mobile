import 'dart:convert';
import 'dart:typed_data';

import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../crypt.dart';

import '/api/api.pb.dart';
import '/api/api.pbgrpc.dart';

Future<bool> createUserRequest() async {
  try {
    final channel = ClientChannel(
      '192.168.1.65',
      port: 50051,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
        codecRegistry:
            CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
      ),
    );
    var crypt = Crypt();
    var prefs = await SharedPreferences.getInstance();
    var persPubString = prefs.getString('persPub') ?? '';
    var persPub = crypt.keyToBytes(persPubString);
    var pubName = prefs.getString('pubName') ?? '';
    var pubNameBytes = utf8.encode(pubName);
    var mesPubString = prefs.getString('mesPub') ?? '';
    var mesPub = crypt.keyToBytes(mesPubString);
    var concatmessage1 = Uint8List.fromList(
        []..addAll(persPub)..addAll(mesPub)..addAll(pubNameBytes));
    var persPrivString = prefs.getString('persPriv') ?? '';
    var sign = crypt.signMessage(persPrivString, concatmessage1);
    final stub = SyncTreeClient(channel);
    final response = await stub
        .userCreate(
          UserCreateRequest(
            publicKey: persPub,
            messsageKey: mesPub,
            publicName: pubName,
            sign: sign,
          ),
        )
        .timeout(
          Duration(milliseconds: 2584),
        );
    return response.passed;
  } catch (Exception) {
    return false;
  }
}
