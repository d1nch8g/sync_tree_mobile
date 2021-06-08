import 'package:flutter/material.dart';
import 'widgets/e.dart';
import 'market/main.dart';
import 'wallet/main.dart';
import 'settings/main.dart';
import 'balance/main.dart';

void main() {
  runApp(
    MaterialApp(
      home: BottomNavigation(),
    ),
  );
}

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

final List<Widget> tabs = [
  MarketPage(),
  BalancePage(),
  WalletPage(),
  SettingsPage(),
];

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 3;

  Color itemColor = palette.smallItemsColor;
  Color backgroundColor = palette.backgroundFillColor;
  Color appBarColor = palette.appBarColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: itemColor,
        unselectedItemColor: itemColor,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.insert_chart_outlined_sharp,
            ),
            backgroundColor: appBarColor,
            label: 'market',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.autorenew_sharp,
            ),
            backgroundColor: appBarColor,
            label: 'balance',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_wallet_outlined,
            ),
            backgroundColor: appBarColor,
            label: 'wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            backgroundColor: appBarColor,
            label: 'account',
          ),
        ],
      ),
    );
  }
}
