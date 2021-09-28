import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/local/balance.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';

class WalletInfo extends StatefulWidget {
  final MarketInfo info;
  WalletInfo({required this.info});
  @override
  State<WalletInfo> createState() => _WalletInfoState();
}

class _WalletInfoState extends State<WalletInfo> {
  String balance = '0';

  updateBalance() async {
    balance = await Balance.marketBalance(
      adress: widget.info.adress,
      delimiter: widget.info.delimiter,
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Hero(
            tag: 'logo',
            child: CachedNetworkImage(
              imageUrl: widget.info.imageLink,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              width: 48,
            ),
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
    );
  }
}
