import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _currentName = 'loading';

  setStartName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var name = prefs.get('pubName');
    setState(() {
      _currentName = name;
    });
  }

  @override
  void initState() {
    super.initState();
    setStartName();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Icon(
            Icons.settings_applications,
            size: 129,
            color: Theme.of(context).hintColor,
          ),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 720),
            child: Text(
              _currentName,
              style: Theme.of(context).textTheme.headline3,
            ),
            transitionBuilder: (
              Widget child,
              Animation<double> animation,
            ) =>
                ScaleTransition(
              scale: animation,
              child: child,
            ),
          ),
          Divider(),
          ListView(
            padding: EdgeInsets.all(8.0),
            shrinkWrap: true,
            children: [
              // Copy key widget
              
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.lock,
                  color: Theme.of(context).hoverColor,
                  size: 29,
                ),
                title: Text(
                  'Change private key',
                  style: Theme.of(context).textTheme.headline5,
                ),
                subtitle: Text(
                  'When you use another private key current one will be lost.',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.handyman_sharp,
                  color: Theme.of(context).hoverColor,
                  size: 29,
                ),
                title: Text(
                  'Generate new keys',
                  style: Theme.of(context).textTheme.headline5,
                ),
                subtitle: Text(
                  'If you generate new keys, current keys will be deleted. Save them in safe place.',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.shield,
                  color: Theme.of(context).hoverColor,
                  size: 29,
                ),
                title: Text(
                  'Set pin code',
                  style: Theme.of(context).textTheme.headline5,
                ),
                subtitle: Text(
                  'When you set a pin, it will be required for each wallet action.',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.person_pin_sharp,
                  color: Theme.of(context).hoverColor,
                  size: 29,
                ),
                title: Text(
                  'Change public name',
                  style: Theme.of(context).textTheme.headline5,
                ),
                subtitle: Text(
                  'You can simply change public name, using single request.',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
