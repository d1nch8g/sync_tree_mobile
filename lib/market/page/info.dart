import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/local/storage.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';

class MarketInfoWidget extends StatefulWidget {
  final MarketInfo info;
  MarketInfoWidget({required this.info});
  @override
  State<MarketInfoWidget> createState() => _MarketInfoWidgetState();
}

class _MarketInfoWidgetState extends State<MarketInfoWidget> {
  String balance = '0';

  updateBalance() async {
    balance = await Storage.loadMarketBalance(
      widget.info.adress,
      widget.info.delimiter,
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    updateBalance();
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
              width: 48,
            ),
            SizedBox(width: 18),
            Text(
              widget.info.name,
              style: Theme.of(context).textTheme.headline2,
            ),
            Spacer(),
            Text(
              balance,
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
        Divider(
          color: Theme.of(context).focusColor,
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            widget.info.description,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
}
