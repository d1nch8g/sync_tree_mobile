import 'package:flutter/material.dart';

import '/security/pin.dart';

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
          () {
            showDialog(
              context: context,
              builder: (_) => GenerateKeyOverlay(),
              barrierDismissible: false,
            );
          },
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

class GenerateKeyOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GenerateKeyOverlayState();
}

class GenerateKeyOverlayState extends State<GenerateKeyOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;
  Widget currentWidget;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 233),
    );
    scaleAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
    currentWidget = SecuritySettings(() {
      setState(() {
        currentWidget = SecuritySaved();
        Future.delayed(Duration(milliseconds: 610), () {
          Navigator.of(context).pop();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            decoration: ShapeDecoration(
              color: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(42, 42, 42, 42),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 377),
                child: currentWidget,
                transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                ) =>
                    ScaleTransition(
                  scale: animation,
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SecuritySettings extends StatelessWidget {
  final Function onSave;
  SecuritySettings(this.onSave);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.52,
      width: MediaQuery.of(context).size.width * 0.62,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Secure acess',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 8),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: pinSettingNames.length,
              itemBuilder: (context, index) {
                var pinEnum = pinSettingNames.keys.elementAt(index);
                return SecureAccessTile(pinEnum, pinSettingNames[pinEnum]);
              },
            ),
          ),
          Divider(),
          SizedBox(height: 8),
          TextButton(
            onPressed: onSave,
            child: Text('ok'),
          ),
        ],
      ),
    );
  }
}

class SecureAccessTile extends StatelessWidget {
  final PinEnum pinEnumItem;
  final String settingText;
  SecureAccessTile(
    this.pinEnumItem,
    this.settingText,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(settingText),
          Icon(Icons.check_box_outline_blank),
        ],
      ),
    );
  }
}

class SecuritySaved extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.52,
      width: MediaQuery.of(context).size.width * 0.62,
      child: Center(
        child: Icon(
          Icons.security_rounded,
          size: 233,
          color: Theme.of(context).focusColor,
        ),
      ),
    );
  }
}
