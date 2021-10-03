import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import '../src/src.dart';

class SaveAsPwd extends StatefulWidget {
  @override
  State<SaveAsPwd> createState() => _SaveAsPwdState();
}

class _SaveAsPwdState extends State<SaveAsPwd> {
  Widget pwdSaver = Container();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enableFeedback: true,
      onTap: () async {
        var keys = (await Storage.loadKeys()).allKeysString;
        showDialog(
          context: context,
          builder: (_) => SaveAsPasswordOverlay(
            keysAsString: keys,
          ),
        );
      },
      leading: Icon(
        Icons.save_rounded,
        color: Theme.of(context).hoverColor,
        size: 29,
      ),
      title: Text(
        'Save private key as a password',
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        'You can save your private key as a password to your cloud storage.',
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}

class SaveAsPasswordOverlay extends StatefulWidget {
  final String keysAsString;
  SaveAsPasswordOverlay({required this.keysAsString});
  @override
  State<StatefulWidget> createState() => SaveAsPasswordOverlayState();
}

class SaveAsPasswordOverlayState extends State<SaveAsPasswordOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Widget savePasswordWidget;

  startPasswordSaving() {
    FlutterClipboard.copy(widget.keysAsString);
    savePasswordWidget = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Container(
              height: 1,
              width: 1,
              child: TextField(
                obscureText: true,
                autofocus: true,
              ),
            ),
            Container(
              height: 6,
              width: 6,
              color: Color.fromRGBO(42, 42, 114, 1.0),
            )
          ],
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('close'),
        ),
      ],
    );
    setState(() {});
  }

  @override
  void initState() {
    savePasswordWidget = IconButton(
      onPressed: () {
        startPasswordSaving();
      },
      iconSize: 62,
      color: Color.fromRGBO(234, 246, 255, 1.0),
      icon: Icon(
        Icons.save_rounded,
      ),
    );
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 377),
    );
    scaleAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.decelerate,
    );
    animationController.addListener(() {
      setState(() {});
    });
    animationController.forward();
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
              padding: const EdgeInsets.fromLTRB(42, 32, 42, 14),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.62,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'SAVE KEY',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Divider(color: Theme.of(context).focusColor),
                    Text(
                      'Press this button to copy your key to clipboard and open your system password manager.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 377),
                      child: savePasswordWidget,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
