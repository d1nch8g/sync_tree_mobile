import 'package:flutter/material.dart';
import 'package:sync_tree_mobile/api/api.pb.dart';
import 'package:sync_tree_mobile/api/userInfo.dart';

class DynamicBalance extends StatefulWidget {
  @override
  _DynamicBalanceState createState() => _DynamicBalanceState();
}

class _DynamicBalanceState extends State<DynamicBalance> {
  String balance = '0';

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
    return Text(
      balance,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
