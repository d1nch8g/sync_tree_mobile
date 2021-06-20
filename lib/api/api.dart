import 'package:grpc/grpc.dart';
import 'package:sync_tree_mobile/api/api.pbgrpc.dart';

final channel = ClientChannel(
  '192.168.1.65',
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
