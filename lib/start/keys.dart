import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:clipboard/clipboard.dart';
import '/widgets/all.dart';

class KeySave extends StatefulWidget {
  @override
  _KeySaveState createState() => _KeySaveState();
}

class _KeySaveState extends State<KeySave> {
  Widget currentWidget = KeysNotReady();

  

  checkingKeysToBeReady() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var key = prefs.getString('persPriv');
    if (key == null) {
      Future.delayed(
        const Duration(seconds: 4),
        () => {
          checkingKeysToBeReady(),
        },
      );
    } else {
      setState(() {
        currentWidget = CopyKeysSection();
      });
      FlutterClipboard.copy(key);
    }
  }

  @override
  void initState() {
    super.initState();
    checkingKeysToBeReady();
  }

  @override
  Widget build(BuildContext context) {
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
            AnimatedSwitcher(
              duration: Duration(milliseconds: 720),
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
      height: 200,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: IconButton(
          icon: Icon(Icons.copy),
          splashRadius: 52,
          color: Theme.of(context).focusColor,
          iconSize: 48,
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) => ButtonOverlay(
                messageText:
                    'Key is copied to\nclipboard. Save it\n in safe place!',
                buttonText: 'continue',
                onPressed: () {
                  Navigator.pushNamed(context, '/main');
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
