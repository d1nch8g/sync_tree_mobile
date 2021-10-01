import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/market/connect.dart';
import 'package:sync_tree_mobile_ui/src/local/balance.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';

class MarketModalPage extends StatefulWidget {
  final MarketInfo info;
  MarketModalPage({required this.info});
  @override
  _MarketModalPageState createState() => _MarketModalPageState();
}

class _MarketModalPageState extends State<MarketModalPage> {
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
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20.0),
          topRight: const Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
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
            Text(
              'Input fee: ${widget.info.inputFee / 100}%\n'
              'Output fee: ${widget.info.outputFee / 100}%\n'
              'Operations: ${widget.info.operationCount}\n'
              'Buys count: ${widget.info.activeBuys}\n'
              'Sells count: ${widget.info.activeSells}\n'
              'Workday: ${widget.info.workTime}',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Divider(
              color: Theme.of(context).focusColor,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: SingleChildScrollView(
                  child: Text(
                    widget.info.description,
                    style: Theme.of(context).textTheme.bodyText2,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConnectionButton(adress: widget.info.adress),
              ],
            )
          ],
        ),
      ),
    );
  }
}
