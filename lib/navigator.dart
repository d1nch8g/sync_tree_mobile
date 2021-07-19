import 'dart:async';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'market/_root.dart';
import 'wallet/_root.dart';
import 'settings/_root.dart';
import 'balance/_root.dart';
import 'start/hello.dart';
import 'start/name.dart';
import 'start/keys.dart';

var routeMap = <String, WidgetBuilder>{
  '/main': (BuildContext context) => PrimaryPage(),
  '/hello': (BuildContext context) => IntroPage(),
  '/name': (BuildContext context) => NameCreation(),
  '/keys': (BuildContext context) => KeySave(),
};

var mainStreamController = StreamController<String>.broadcast();
var mainStream = mainStreamController.stream;

///                    ===[MAIN STREAM DESCRIPTION]===
///    This stream is main, and is ruling the whole app dynamic conditions.
/// If something needs to be changed independantly of the position in the
/// widget tree (hard to stick with linear dependency), than this stream is
/// gonna help. This stream contains 'string' events, representing changes in
/// some conditions. Due to changes in those 'conditions', some actions may be
/// triggered.
///     Listing:
/// 1) pubNameEvent - event, representing that public name in memory has been
/// updated. Public name in prefs - 'pubName'
/// 2) balanceEvent - event, representing that main balance has been updated
/// in memory. Balance in prefs - 'balance'
/// 3) `id` - event, that contains some market id represented in base64,
/// represents memory change in balance of some specific market. Market
/// balance in prefs - 'id'
/// 4) marketsEvent - event, representing the changes in currently connected
/// markets. Markets in prefs - 'markets'

class PrimaryPage extends StatefulWidget {
  @override
  _PrimaryPageState createState() => _PrimaryPageState();
}

class _PrimaryPageState extends State<PrimaryPage> {
  int _selectedIndex = 0;
  late PageController _pageController;

  void checkFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var firstLaunch = prefs.getBool('firstLaunch') ?? true;
    prefs.setBool('firstLaunch', false);
    if (firstLaunch) {
      Navigator.pushNamed(context, '/hello');
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 320),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _selectedIndex,
    );
    checkFirstLaunch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).focusColor,
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _selectedIndex = index);
          },
          children: <Widget>[
            MarketPage(),
            BalancePage(),
            WalletPage(),
            SettingsPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Theme.of(context).focusColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'markets',
            icon: Icon(Icons.query_stats_rounded),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          BottomNavigationBarItem(
            label: 'balance',
            icon: Icon(Icons.credit_card_rounded),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          BottomNavigationBarItem(
            label: 'wallet',
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
