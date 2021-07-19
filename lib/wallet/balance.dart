import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sync_tree_mobile/api/infoUser.dart';
import 'package:sync_tree_mobile/navigator.dart';

class DynamicBalance extends StatefulWidget {
  @override
  _DynamicBalanceState createState() => _DynamicBalanceState();
}

class _DynamicBalanceState extends State<DynamicBalance> {
  String balance = '';

  void loadFromMemory() async {
    var prefs = await SharedPreferences.getInstance();
    var memoryBalance = prefs.getInt('balance');
    balance = memoryBalance.toString();
  }

  void startStreamListening() {
    mainStream.listen((event) {
      if (event == 'balanceEvent') {
        loadFromMemory();
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    loadFromMemory();
    startStreamListening();
    updateSelfInformation();
    super.initState();
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
