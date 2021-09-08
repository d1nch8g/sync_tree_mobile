import 'package:grpc/grpc.dart';

import '../_net/api.pbgrpc.dart';

final channel = ClientChannel(
  '46.138.246.106',
  port: 8080,
  options: ChannelOptions(
    credentials: ChannelCredentials.insecure(),
    codecRegistry: CodecRegistry(
      codecs: const [
        GzipCodec(),
        IdentityCodec(),
      ],
    ),
    connectionTimeout: Duration(milliseconds: 384),
  ),
);
final stub = SyncTreeClient(channel);
