import 'package:flutter/material.dart';
import '../navigator.dart';
import '../src/src.dart';

class DynamicBalance extends StatefulWidget {
  @override
  _DynamicBalanceState createState() => _DynamicBalanceState();
}

class _DynamicBalanceState extends State<DynamicBalance> {
  String balance = '';

  void updateBalance() async {
    var memoryBalance = await Storage.loadMainBalance();
    if (mounted) {
      setState(() {
        if (memoryBalance == 0) {
          this.balance = 'Balance - 0';
        } else {
          this.balance = 'Main: ${memoryBalance.toString()}';
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    updateSelfInformation();
    updateBalance();
    Storage.createTriggerSubscription(
      trigger: Trigger.mainBalanceUpdate,
      onTriggerEvent: () {
        updateBalance();
      },
    );
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
