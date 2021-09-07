import 'package:grpc/grpc.dart';
import 'package:flutter/material.dart';

import '../_net/api.pbgrpc.dart';

// home    192.168.1.66
// cafe    10.5.7.140
// mobile  172.20.10.4
// office  192.168.60.74

SyncTreeClient getStub(context) {
  while (true) {
    try {
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
      return stub;
    } catch (Exception) {
      showDialog(
        context: context,
        builder: (_) => ConnectionErrorOverlay(),
      );
    }
  }
}

class ConnectionErrorOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ConnectionErrorOverlayState();
}

class ConnectionErrorOverlayState extends State<ConnectionErrorOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 377),
    );
    scaleAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: ShapeDecoration(
              color: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'connection error',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Icon(
                    Icons.wifi_off_rounded,
                    size: 144,
                    color: Theme.of(context).focusColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
