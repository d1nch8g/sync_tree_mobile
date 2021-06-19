import 'dart:typed_data';

import 'package:grpc/grpc.dart';
import '/api/api.pb.dart';
import '/api/api.pbgrpc.dart';

Future<bool> createUserRequest(
  Uint8List pubKey,
  Uint8List mesKey,
  String pubName,
  Uint8List sign,
) async {
  final channel = ClientChannel(
    'localhost',
    port: 50051,
    options: ChannelOptions(
      credentials: ChannelCredentials.insecure(),
      codecRegistry:
          CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    ),
  );

  final stub = SyncTreeClient(channel);

  final response = await stub.userCreate(
    UserCreateRequest(
      publicKey: pubKey,
      messsageKey: mesKey,
      publicName: pubName,
      sign: sign,
    ),
  );
  return response.passed;
}
