import 'package:grpc/grpc.dart';

import '../_net/api.pbgrpc.dart';

// home    192.168.1.66
// cafe    10.5.7.140
// mobile  172.20.10.4
// office  192.168.60.74

final channel = ClientChannel(
  '192.168.60.74',
  port: 50051,
  options: ChannelOptions(
    credentials: ChannelCredentials.insecure(),
    codecRegistry: CodecRegistry(
      codecs: const [
        GzipCodec(),
        IdentityCodec(),
      ],
    ),
  ),
);
final stub = SyncTreeClient(channel);
