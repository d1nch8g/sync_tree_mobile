import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';

class MarketInfoWidget extends StatefulWidget {
  final MarketInfo info;
  MarketInfoWidget({required this.info});
  @override
  State<MarketInfoWidget> createState() => _MarketInfoWidgetState();
}

class _MarketInfoWidgetState extends State<MarketInfoWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CachedNetworkImage(
              imageUrl: widget.info.imageLink,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ],
        ),
      ],
    );
  }
}
