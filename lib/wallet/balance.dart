import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/sync_tree_modile_logic.dart';

class DynamicBalance extends StatefulWidget {
  @override
  _DynamicBalanceState createState() => _DynamicBalanceState();
}

class _DynamicBalanceState extends State<DynamicBalance> {
  String balance = '0';

  void uploadNewBalance() async {
    try {
      var keys = await Storage.loadKeys();
      var selfAdress = keys.personal.public.getAdressBase64();
      var balance = (await InfoCalls.userInfo(selfAdress)).balance;
      print(balance);
      Storage.saveMainBalance(balance);
    } catch (e) {}
  }

  void updateBalance() async {
    var memoryBalance = await Storage.loadMainBalance();
    setState(() {
      this.balance = memoryBalance.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    uploadNewBalance();
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
