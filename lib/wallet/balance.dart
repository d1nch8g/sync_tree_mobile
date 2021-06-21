import 'package:flutter/material.dart';
import 'package:sync_tree_mobile/api/userInfo.dart';

class DynamicBalance extends StatefulWidget {
  @override
  _DynamicBalanceState createState() => _DynamicBalanceState();
}

class _DynamicBalanceState extends State<DynamicBalance> {
  String balance = '';

  void setActualBalance() async {
    var requestBalance = await selfBalance();
    setState(() {
      balance = requestBalance.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    setActualBalance();
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
