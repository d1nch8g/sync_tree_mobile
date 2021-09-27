import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/local/balance.dart';
import 'package:sync_tree_mobile_ui/src/src.dart';
import 'package:sync_tree_mobile_ui/wallet/page/frame.dart';

class WalletTile extends StatefulWidget {
  final MarketInfo info;
  WalletTile({required this.info});
  @override
  _WalletTileState createState() => _WalletTileState();
}

class _WalletTileState extends State<WalletTile> {
  double animatedHeight = 126;
  @override
  void initState() {
    super.initState();
  }

  increaseContainer() {
    Future.delayed(Duration(milliseconds: 34), () {
      if (mounted) {
        setState(() {
          animatedHeight = 126;
        });
      }
    });
  }

  decreaseContainer() {
    Future.delayed(Duration(milliseconds: 34), () {
      setState(() {
        animatedHeight = 92;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Stack(
        children: [
          Row(
            children: [
              SizedBox(width: 110),
              OpenContainer(
                closedColor: Theme.of(context).hoverColor,
                openColor: Theme.of(context).backgroundColor,
                transitionDuration: Duration(milliseconds: 610),
                closedShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(14.0),
                  ),
                ),
                closedBuilder: (context, action) {
                  increaseContainer();
                  return Container(
                    height: 126,
                    width: MediaQuery.of(context).size.width * 0.62,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(widget.info.name),
                        Text(widget.info.workTime),
                        Text(
                          'Fee in: ${(widget.info.inputFee / 100).toString()}% '
                          'out: ${(widget.info.outputFee / 100).toString()}%',
                        ),
                        DynamicMarketBalance(
                          adress: widget.info.adress,
                          delimiter: widget.info.delimiter,
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).hoverColor,
                      borderRadius: BorderRadius.circular(14),
                    ),
                  );
                },
                openBuilder: (context, action) {
                  decreaseContainer();
                  return ConnectedWalletPage(closeContainer: () {
                    action();
                  });
                },
              ),
            ],
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 377),
            height: animatedHeight,
            child: CircleAvatar(
              radius: 63,
              backgroundColor: Theme.of(context).focusColor,
              child: Container(
                child: CachedNetworkImage(
                  imageUrl: widget.info.imageLink,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                height: 98,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DynamicMarketBalance extends StatefulWidget {
  final String adress;
  final int delimiter;
  DynamicMarketBalance({
    required this.adress,
    required this.delimiter,
  });
  @override
  _DynamicMarketBalanceState createState() => _DynamicMarketBalanceState();
}

class _DynamicMarketBalanceState extends State<DynamicMarketBalance> {
  String balance = '';
  void setBalance() async {
    balance = await Balance.marketBalance(
      adress: widget.adress,
      delimiter: widget.delimiter,
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    setBalance();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Balance: $balance');
  }
}
