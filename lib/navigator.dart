import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/introduction.dart';
import 'package:sync_tree_mobile_ui/market/frame.dart';
import '../src/src.dart';

import 'wallet/frame.dart';
import 'settings/frame.dart';

var routeMap = <String, WidgetBuilder>{
  '/main': (BuildContext context) => PrimaryPage(),
  '/intro': (BuildContext context) => IntroPage(),
};

class PrimaryPage extends StatefulWidget {
  @override
  _PrimaryPageState createState() => _PrimaryPageState();
}

class _PrimaryPageState extends State<PrimaryPage> {
  int bottomBarIndex = 0;
  late PageController bottomBarController;
  late StreamSubscription<Trigger> subscription;

  void checkFirstLaunch() async {
    var isFirstLaunch = await Storage.checkIfFirstLaunch();
    if (isFirstLaunch) {
      Storage.saveBottomPadding(padding: MediaQuery.of(context).padding.bottom);
      Navigator.pushNamed(context, '/intro');
    }
  }

  @override
  void dispose() {
    bottomBarController.dispose();
    super.dispose();
  }

  void onTap(int index) {
    setState(() {
      bottomBarIndex = index;
      bottomBarController.animateToPage(
        index,
        duration: Duration(milliseconds: 320),
        curve: Curves.easeOut,
      );
    });
  }

  moveToSearchPage() {
    setState(() {
      bottomBarIndex = 0;
      bottomBarController.animateToPage(
        0,
        duration: Duration(milliseconds: 320),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    bottomBarController = PageController(
      initialPage: bottomBarIndex,
    );
    checkFirstLaunch();
    subscription = mainStream.listen((event) {
      if (mounted) {
        if (event == Trigger.moveToMarketPage) {
          moveToSearchPage();
        }
      } else {
        subscription.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).focusColor,
      body: SizedBox.expand(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: bottomBarController,
          onPageChanged: (index) {
            setState(() => bottomBarIndex = index);
          },
          children: <Widget>[
            MarketPage(),
            WalletPage(),
            SettingsPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        fixedColor: Theme.of(context).focusColor,
        unselectedItemColor: Theme.of(context).focusColor,
        currentIndex: bottomBarIndex,
        enableFeedback: true,
        onTap: onTap,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'markets',
            icon: Icon(Icons.manage_search_rounded),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          BottomNavigationBarItem(
            label: 'wallets',
            icon: Icon(Icons.account_balance_wallet_outlined),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          BottomNavigationBarItem(
            label: 'settings',
            icon: Icon(Icons.settings),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
        ],
      ),
    );
  }
}
