import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/local/balance.dart';
import 'package:sync_tree_mobile_ui/src/local/storage.dart';
import 'package:sync_tree_mobile_ui/src/local/stream.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';
import 'package:sync_tree_mobile_ui/wallet/page/deposit.dart';
import 'package:sync_tree_mobile_ui/wallet/page/info.dart';
import 'package:sync_tree_mobile_ui/wallet/page/trade.dart';

class ConnectedWalletPage extends StatefulWidget {
  final MarketInfo info;
  final Function closeContainer;
  final int initialIndex;
  final List<String> messages;
  ConnectedWalletPage({
    required this.closeContainer,
    required this.info,
    required this.initialIndex,
    required this.messages,
  });

  @override
  State<ConnectedWalletPage> createState() => _ConnectedWalletPageState();
}

bool resizekb = true;

class _ConnectedWalletPageState extends State<ConnectedWalletPage> {
  late int bottomBarIndex;
  late PageController bottomBarController;
  String balance = '0';
  double bottomNavBarPadHeight = 0;

  @override
  void dispose() {
    bottomBarController.dispose();
    super.dispose();
  }

  void onTap(int index) async {
    setState(() {
      bottomBarIndex = index;
      bottomBarController.animateToPage(
        index,
        duration: Duration(milliseconds: 320),
        curve: Curves.easeOut,
      );
    });
    Storage.saveMarketWalletPosition(widget.info.adress, index);
  }

  updateInfo() async {
    balance = await Balance.marketBalance(
      adress: widget.info.adress,
      delimiter: widget.info.delimiter,
    );
    bottomNavBarPadHeight = await Storage.loadBottomPadding();
    setState(() {});
  }

  @override
  void initState() {
    bottomBarIndex = widget.initialIndex;
    bottomBarController = PageController(
      initialPage: bottomBarIndex,
    );
    updateInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var kbsize = MediaQuery.of(context).viewInsets.bottom;
    if (kbsize > 0) {
      kbsize = kbsize - bottomNavBarPadHeight - 144;
    }
    if (resizekb == false) {
      kbsize = 0;
    }
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          TopLogoBalance(
            balance: balance,
            info: widget.info,
          ),
          Expanded(
            child: SizedBox.expand(
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: bottomBarController,
                onPageChanged: (index) {
                  setState(() => bottomBarIndex = index);
                },
                children: [
                  InfoPage(
                    info: widget.info,
                    closeContainer: () {
                      widget.closeContainer();
                    },
                  ),
                  TradePage(
                    info: widget.info,
                    closeContainer: () {
                      widget.closeContainer();
                    },
                  ),
                  DepositPage(
                    info: widget.info,
                    closeContainer: () {
                      widget.closeContainer();
                    },
                    messages: widget.messages,
                  ),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 377),
            curve: Curves.ease,
            height: kbsize,
          ),
        ],
      ),
      bottomNavigationBar: FloatingNavbar(
        backgroundColor: Theme.of(context).primaryColorDark,
        currentIndex: bottomBarIndex,
        onTap: onTap,
        iconSize: 32,
        fontSize: 13.5,
        unselectedItemColor: Theme.of(context).focusColor,
        selectedItemColor: Theme.of(context).primaryColorDark,
        selectedBackgroundColor: Theme.of(context).focusColor,
        items: [
          FloatingNavbarItem(
            icon: Icons.info,
            title: 'info',
          ),
          FloatingNavbarItem(
            icon: Icons.query_stats_rounded,
            title: 'trade',
          ),
          FloatingNavbarItem(
            icon: Icons.chat,
            title: 'deposit',
          ),
        ],
      ),
    );
  }
}

class TopLogoBalance extends StatefulWidget {
  const TopLogoBalance({
    Key? key,
    required this.info,
    required this.balance,
  }) : super(key: key);

  final MarketInfo info;
  final String balance;

  @override
  State<TopLogoBalance> createState() => _TopLogoBalanceState();
}

class _TopLogoBalanceState extends State<TopLogoBalance> {
  late String balance;
  late StreamSubscription<Trigger> subscription;

  updateBalance() async {
    balance = await Balance.marketBalance(
      adress: widget.info.adress,
      delimiter: widget.info.delimiter,
    );
  }

  @override
  void initState() {
    balance = widget.balance;
    super.initState();
    subscription = mainStream.listen((event) {
      if (mounted) {
        if (event == Trigger.marketBalanceUpdate) {
          updateBalance();
        }
      } else {
        subscription.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                SizedBox(width: 8),
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
                SizedBox(width: 8),
              ],
            ),
            Divider(color: Theme.of(context).focusColor)
          ],
        ),
      ),
    );
  }
}

class FloatingButton extends StatelessWidget {
  final Function closeContainer;
  FloatingButton({required this.closeContainer});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.cancel),
      iconSize: 42,
      splashRadius: 32,
      color: Theme.of(context).focusColor,
      onPressed: () {
        closeContainer();
      },
    );
  }
}
