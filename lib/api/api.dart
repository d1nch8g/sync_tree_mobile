import 'package:grpc/grpc.dart';
import 'package:sync_tree_mobile/api/api.pbgrpc.dart';

// home    192.168.1.66
// cafe    10.5.7.140
// mobile  172.20.10.4
// novosib 192.168.1.60

final channel = ClientChannel(
  '192.168.1.60',
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
