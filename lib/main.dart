import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'market/main.dart';
import 'wallet/main.dart';
import 'settings/main.dart';
import 'balance/main.dart';
import 'start/main.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(35, 37, 40, 1.0),
        focusColor: Color.fromRGBO(234, 246, 255, 1.0),
        hintColor: Color.fromRGBO(255, 164, 0, 1.0),
        hoverColor: Color.fromRGBO(0, 159, 253, 1.0),
        buttonColor: Color.fromRGBO(42, 42, 114, 1.0),
      ),
      home: PrimaryPage(),
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => PrimaryPage(),
        '/firstLaunch': (BuildContext context) => IntroPage(),
      },
    );
  }
}

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
    prefs.setBool('firstLaunch', false);
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
        if (firstLaunch) {Navigator.pushNamed(context, '/firstLaunch')}
      },
    );
    return Scaffold(
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
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            label: 'balance',
            icon: Icon(Icons.autorenew_sharp),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            label: 'wallet',
            icon: Icon(Icons.account_balance_wallet_outlined),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            label: 'settings',
            icon: Icon(Icons.settings),
            backgroundColor: Theme.of(context).primaryColor,
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
