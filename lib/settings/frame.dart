import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/settings/load_as_pwd.dart';
import 'package:sync_tree_mobile_ui/settings/save_as_pwd.dart';
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
  late StreamSubscription<Trigger> subscription;

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
    subscription = mainStream.listen((event) {
      if (mounted) {
        if (event == Trigger.publicNameUpdate ||
            event == Trigger.mainBalanceUpdate) {
          displayNewData();
        }
      } else {
        subscription.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Icon(
            Icons.settings_applications,
            size: MediaQuery.of(context).size.height * 0.162,
            color: Theme.of(context).hintColor,
          ),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 377),
            child: Text(
              name,
              style: Theme.of(context).textTheme.headline3,
              key: UniqueKey(),
            ),
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
                SaveAsPwd(),
                Divider(),
                LoadAsPwd(),
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
