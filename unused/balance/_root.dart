import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sync_tree_mobile/balance/wallets.dart';

class BalancePage extends StatefulWidget {
  @override
  _BalancePageState createState() => _BalancePageState();
}

class _BalancePageState extends State<BalancePage> {
  String balanceText = ' ';

  void loadBalanceText() async {
    var prefs = await SharedPreferences.getInstance();
    var adresses = prefs.getStringList('wallets') ?? [];
    setState(() {
      var resText = adresses.length.toString() + ' wallets';
      if (resText == '1 wallets') {
        resText = '1 wallet';
      }
      balanceText = resText;
    });
  }

  @override
  void initState() {
    loadBalanceText();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Icon(
            Icons.credit_card_rounded,
            size: MediaQuery.of(context).size.height * 0.15,
            color: Theme.of(context).hintColor,
          ),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 144),
            child: Text(
              balanceText,
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Divider(),
          ConnectedWallets(),
        ],
      ),
    );
  }
}
