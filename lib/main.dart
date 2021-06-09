import 'package:flutter/material.dart';
import 'widgets/e.dart';
import 'market/main.dart';
import 'wallet/main.dart';
import 'settings/main.dart';
import 'balance/main.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.amber),
      ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
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
            label: 'market',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.autorenew_sharp,
            ),
            label: 'balance',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_wallet_outlined,
            ),
            label: 'wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'account',
          ),
        ],
      ),
    );
  }
}
