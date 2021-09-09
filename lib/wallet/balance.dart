import 'package:flutter/material.dart';
import 'package:sync_tree_mobile/_local/storage.dart';
import 'package:sync_tree_mobile/_local/stream.dart';
import 'package:sync_tree_mobile/_net/unified_calls.dart';

class DynamicBalance extends StatefulWidget {
  @override
  _DynamicBalanceState createState() => _DynamicBalanceState();
}

class _DynamicBalanceState extends State<DynamicBalance> {
  String balance = '';

  void updateBalanceFromMemory() async {
    var memoryBalance = await loadValue(StorageKey.mainBalance);
    setState(() {
      balance = memoryBalance.toString();
    });
  }

  @override
  void initState() {
    updateBalanceFromMemory();
    super.initState();
    updateUserInfo();
    triggerListener(
      Trigger.mainBalanceUpdate,
      updateBalanceFromMemory,
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
