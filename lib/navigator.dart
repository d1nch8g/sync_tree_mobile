import 'dart:async';

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'market/market.dart';
import 'market/page.dart';
import 'wallet/wallet.dart';
import 'settings/settings.dart';
import 'balance/main.dart';
import 'start/hello.dart';
import 'start/name.dart';
import 'start/keys.dart';

var routeMap = <String, WidgetBuilder>{
  '/main': (BuildContext context) => PrimaryPage(),
  '/hello': (BuildContext context) => IntroPage(),
  '/name': (BuildContext context) => NameCreation(),
  '/keys': (BuildContext context) => KeySave(),
  '/market': (BuildContext context) => MarketHero(),
};

var mainStreamController = StreamController<String>.broadcast();
var mainStream = mainStreamController.stream;

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
    prefs.setBool('firstLaunch', false); // change to true to go to start
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
