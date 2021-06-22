import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sync_tree_mobile/api/userInfo.dart';
import 'package:sync_tree_mobile/navigator.dart';

class DynamicBalance extends StatefulWidget {
  @override
  _DynamicBalanceState createState() => _DynamicBalanceState();
}

class _DynamicBalanceState extends State<DynamicBalance> {
  String balance = '';

  void setActualBalance() async {
    var requestBalance = await selfBalance();
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt('balance', requestBalance.toInt());
    setState(() {
      balance = requestBalance.toString();
    });
  }

  void startBalanceListen() {
    mainStream.listen((event) {
      if (event == 'balanceChange') {
        
        setActualBalance();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    setActualBalance();
    startBalanceListen();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      child: Text(
        balance,
        style: Theme.of(context).textTheme.headline3,
        key: UniqueKey(),
      ),
      duration: Duration(milliseconds: 377),
    );
  }
}
