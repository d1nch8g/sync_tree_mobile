import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'market/main.dart';
import 'wallet/main.dart';
import 'settings/settings.dart';
import 'balance/main.dart';
import 'start/hello.dart';
import 'start/name.dart';
import 'start/keys.dart';

var routeMap = <String, WidgetBuilder>{
  '/main': (BuildContext context) => PrimaryPage(),
  '/hello': (BuildContext context) => IntroPage(),
  '/name': (BuildContext context) => GoogleAuth(),
  '/keys': (BuildContext context) => KeySave(),
};

class PrimaryPage extends StatefulWidget {
  @override
  _PrimaryPageState createState() => _PrimaryPageState();
}

class _PrimaryPageState extends State<PrimaryPage> {
  int _selectedIndex = 0;
  PageController _pageController;

  Future<bool> firstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var firstLaunch = prefs.getBool('firstLaunch');
    prefs.setBool('firstLaunch', false); // change to true to go to start
    return firstLaunch ?? true;
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    firstLaunch().then(
      (firstLaunch) => {
        if (firstLaunch) {Navigator.pushNamed(context, '/hello')}
      },
    );
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
        fixedColor: Theme.of(context).focusColor,
        unselectedItemColor: Theme.of(context).focusColor,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'markets',
            icon: Icon(Icons.insert_chart_outlined_sharp),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          BottomNavigationBarItem(
            label: 'balance',
            icon: Icon(Icons.autorenew_sharp),
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 320), curve: Curves.easeOut);
    });
  }
}
