import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sync_tree_modile_ui/navigator.dart';
import 'package:sync_tree_modile_ui/src/src.dart';
import 'package:sync_tree_modile_ui/password.dart';
import 'package:sync_tree_modile_ui/settings/changeKey.dart';
import 'package:sync_tree_modile_ui/start/hello.dart';

class GenerateKeyTile extends StatelessWidget {
  showKeyGenerationOverlay(context) {
    passwordCheck(context, () {
      showDialog(
        context: context,
        builder: (_) => GenerateKeyOverlay(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showKeyGenerationOverlay(context);
      },
      leading: Icon(
        Icons.handyman_sharp,
        color: Theme.of(context).hoverColor,
        size: 29,
      ),
      title: Text(
        'Generate new key',
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        'If you generate new keys, current keys will be deleted. Save them in safe place.',
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
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Widget currentContent;
  late String oldKeys;
  bool overlayIsOpen = true;

  @override
  void initState() {
    super.initState();
    prepareControllerAnimations();
    setAskingOverlay();
  }

  prepareControllerAnimations() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 377),
    );
    scaleAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  setAskingOverlay() {
    setState(() {
      currentContent = AskerContent(
        startBuildingAndUploadingKeys: () {
          setBuildingOverlay();
        },
      );
    });
  }

  setBuildingOverlay() async {
    setState(() {
      currentContent = BuilderContent();
    });
    var oldKeys = await Storage.loadKeys();
    this.oldKeys = oldKeys.allKeysString;
    var keys = await compute(generateKeys, true);
    Storage.saveKeys(keys);
    try {
      var newUserCreateSuccess = await UserCalls.create();
      if (newUserCreateSuccess) {
        setDoneOverlay();
      } else {
        setErrorOverlay();
      }
    } catch (e) {
      setErrorOverlay();
    }
  }

  setDoneOverlay() {
    setState(() {
      currentContent = FinishedContent(
        closeOverlayFunciton: () {
          if (overlayIsOpen) {
            overlayIsOpen = false;
            Navigator.pop(context);
          }
        },
      );
      removeOldWalletInfoFromStorage();
      Future.delayed(Duration(milliseconds: 377), () {
        updateSelfInformation();
      });
    });
    Future.delayed(Duration(milliseconds: 1597), () {
      if (overlayIsOpen) {
        Navigator.pop(context);
      }
    });
  }

  setErrorOverlay() {
    Storage.saveKeys(this.oldKeys);
    setState(() {
      currentContent = ConnectionErrorContent(
        closeOverlayFunciton: () {
          overlayIsOpen = false;
          if (overlayIsOpen) {
            Navigator.pop(context);
          }
        },
      );
    });
    Future.delayed(Duration(milliseconds: 1597), () {
      if (overlayIsOpen) {
        Navigator.pop(context);
      }
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
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: ShapeDecoration(
              color: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(42, 42, 42, 14),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 377),
                child: currentContent,
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

class AskerContent extends StatelessWidget {
  final Function startBuildingAndUploadingKeys;
  AskerContent({required this.startBuildingAndUploadingKeys});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Are you sure?\n'
          'If you generate new key, current key will be deleted.',
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'cancel',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            TextButton(
              onPressed: () {
                startBuildingAndUploadingKeys();
              },
              child: Text(
                'ok',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
      ],
    );
  }
}

class BuilderContent extends StatefulWidget {
  @override
  _BuilderContentState createState() => _BuilderContentState();
}

class _BuilderContentState extends State<BuilderContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Building keys\n',
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        SizedBox(
          width: 200,
          height: 200,
          child: Center(
            child: SpinKitCubeGrid(
              color: Theme.of(context).focusColor,
              size: 142.0,
              duration: const Duration(milliseconds: 1124),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class FinishedContent extends StatelessWidget {
  final Function closeOverlayFunciton;
  FinishedContent({required this.closeOverlayFunciton});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Keys are ready',
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          width: 200,
          height: 200,
          child: Center(
            child: Icon(
              Icons.check_circle_outline_rounded,
              size: 140,
              color: Theme.of(context).focusColor,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            closeOverlayFunciton();
          },
          child: Text(
            'close',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}

class ConnectionErrorContent extends StatelessWidget {
  final Function closeOverlayFunciton;
  ConnectionErrorContent({required this.closeOverlayFunciton});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Unable to upload',
          style: Theme.of(context).textTheme.headline2,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          width: 200,
          height: 200,
          child: Center(
            child: Icon(
              Icons.signal_cellular_connected_no_internet_4_bar_rounded,
              size: 140,
              color: Theme.of(context).focusColor,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            closeOverlayFunciton();
          },
          child: Text(
            'close',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
