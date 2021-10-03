import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/settings/logo.dart';
import 'package:sync_tree_mobile_ui/src/local/balance.dart';
import '../src/src.dart';

import 'change_key.dart';
import 'copy_key.dart';
import 'generate_key.dart';
import 'licenses.dart';
import 'pub_name.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String name = '';
  String balance = '';

  displayNewData() async {
    var loadedName = await Storage.loadPublicName();
    var loadedBalance = await Balance.mainBalance();
    if (mounted) {
      setState(() {
        name = loadedName;
        balance = loadedBalance;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    displayNewData();
    Storage.createTriggerSubscription(
      trigger: Trigger.publicNameUpdate,
      onTriggerEvent: displayNewData,
    );
    Storage.createTriggerSubscription(
      trigger: Trigger.mainBalanceUpdate,
      onTriggerEvent: displayNewData,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SettingsLogo(
            pubName: name,
            balance: balance,
          ),
          Divider(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(3.0),
              children: [
                CopyKeyTile(),
                Divider(),
                ChangeKeyTile(),
                Divider(),
                GenerateKeyTile(),
                Divider(),
                PublicNameTile(),
                Divider(),
                LicensesTile(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
