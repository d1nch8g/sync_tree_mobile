import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:clipboard/clipboard.dart';

class KeySave extends StatefulWidget {
  @override
  _KeySaveState createState() => _KeySaveState();
}

class _KeySaveState extends State<KeySave> {
  Widget currentWidget = KeysNotReady();

  Future sleep1() {
    return new Future.delayed(const Duration(seconds: 12), () => "1");
  }

  checkingKeysToBeReady() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var key = prefs.getString('persPriv');
    if (key == null) {
      sleep1();
    }
    FlutterClipboard.copy('key');
    setState(() {
      currentWidget = CopyKeysSection();
    });
  }

  @override
  Widget build(BuildContext context) {
    checkingKeysToBeReady();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'save your key',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Text(
                'This text is private key. Keep it in secret place. All '
                'assets in this app are related to this key. You can change '
                'it later in settings.',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            SizedBox(height: 12),
            currentWidget,
          ],
        ),
      ),
    );
  }
}

class KeysNotReady extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: SpinKitCubeGrid(
          color: Theme.of(context).focusColor,
          size: 142.0,
          duration: const Duration(milliseconds: 1124),
        ),
      ),
    );
  }
}

class CopyKeysSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: CircleAvatar(
          radius: 34,
          backgroundColor: Theme.of(context).focusColor,
          child: IconButton(
            icon: Icon(Icons.copy),
            splashRadius: 52,
            color: Theme.of(context).backgroundColor,
            iconSize: 48,
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => FunkyOverlay(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class FunkyOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FunkyOverlayState();
}

class FunkyOverlayState extends State<FunkyOverlay>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 320));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.decelerate);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
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
              padding: const EdgeInsets.fromLTRB(42, 42, 42, 14),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Key is copied to\nclipboard. Save it\n in safe place!',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      child: Text('continue'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/main');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
