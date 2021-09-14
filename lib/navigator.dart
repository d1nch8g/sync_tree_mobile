import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/sync_tree_modile_logic.dart';

import 'market/_root.dart';
import 'wallet/_root.dart';
import 'settings/_root.dart';
import 'start/hello.dart';
import 'start/name.dart';
import 'start/keys.dart';

var firstLaunchRoutMap = <String, WidgetBuilder>{
  '/main': (BuildContext context) => PrimaryPage(),
  '/hello': (BuildContext context) => IntroPage(),
  '/name': (BuildContext context) => NameCreation(),
  '/keys': (BuildContext context) => KeySave(),
};

class PrimaryPage extends StatefulWidget {
  @override
  _PrimaryPageState createState() => _PrimaryPageState();
}

class _PrimaryPageState extends State<PrimaryPage> {
  int _selectedIndex = 0;
  late PageController _pageController;

  void checkFirstLaunch() async {
    var isFirstLaunch = await Storage.checkIfFirstLaunch();
    if (isFirstLaunch) {
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
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _selectedIndex = index);
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
        currentIndex: _selectedIndex,
        enableFeedback: true,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'markets',
            icon: Icon(Icons.query_stats_rounded),
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
