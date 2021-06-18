import 'package:flutter/material.dart';

import '../pin/pin.dart';

class SecuritySetTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.shield_rounded,
        color: Theme.of(context).hoverColor,
        size: 29,
      ),
      onTap: () {
        checkPwd(
          context,
          () {},
          PinEnum.securitySettings,
        );
      },
      title: Text(
        'Security settings',
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        'Here you can configure which application actions will require pin.',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}

/*
  Which actions will be using pin 100%:
1 - Changing pin
2 - Accesing security settings

  Which actions can be configurable with pin:
Settings:
1 - Copy private key
2 - Change private key
3 - Generate new keys
4 - Change public name
5 - Save changes to server
Wallet:
1 - 
Balance:
1 - 
Markets:
1 - 
*/