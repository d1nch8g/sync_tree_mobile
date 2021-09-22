import 'package:grpc/grpc.dart';

import 'api.pbgrpc.dart';

final channel = ClientChannel(
  '46.138.246.106', //106
  port: 8080,
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
final stub = SyncTreeClient(
  channel,
  options: CallOptions(
    timeout: Duration(seconds: 1),
  ),
);
