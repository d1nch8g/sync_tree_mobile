import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/sync_tree_modile_logic.dart';

class DynamicBalance extends StatefulWidget {
  @override
  _DynamicBalanceState createState() => _DynamicBalanceState();
}

class _DynamicBalanceState extends State<DynamicBalance> {
  String balance = '';

  void updateBalanceFromMemory() async {
    var memoryBalance = Storage.loadMainBalance();
    setState(() {
      balance = memoryBalance.toString();
    });
  }

  @override
  void initState() async {
    updateBalanceFromMemory();
    super.initState();
    var keys = await Storage.loadKeys();
    var selfAdress = keys.personal.public.getAdressBase64();
    var selfInfo = await InfoCalls.userInfo(selfAdress);
    Storage.saveMainBalance(selfInfo.balance);
    Storage.createTriggerSubscription(
      trigger: Trigger.mainBalanceUpdate,
      onTriggerEvent: updateBalanceFromMemory,
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
