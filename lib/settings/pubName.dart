import 'package:flutter/material.dart';
import 'package:sync_tree_mobile/_local/storage.dart';
import 'package:sync_tree_mobile/_local/stream.dart';
import 'package:sync_tree_mobile/_net/unified_calls.dart';

import '../_local/password.dart';
import '../_local/filter.dart';

class PublicNameTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.person_pin_sharp,
        color: Theme.of(context).hoverColor,
        size: 29,
      ),
      onTap: () {
        checkPwd(context, () {
          showDialog(
            context: context,
            builder: (_) => GenerateKeyOverlay(),
          );
        });
      },
      title: Text(
        'Change public name',
        style: Theme.of(context).textTheme.headline5,
      ),
      subtitle: Text(
        'You can simply change public name, using single request.',
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
  late Widget currentWidget;

  final TextEditingController textController = TextEditingController();

  void onComplete() async {
    var filter = Filter();
    if (filter.operateCheck(textController, context)) {
      var previousName = await loadValue(StorageKey.publicName);
      saveValue(StorageKey.publicName, textController.text);
      var nameChangedSuccessfully = await updateUserInfo();
      if (nameChangedSuccessfully) {
        setState(() {
          currentWidget = NameReadyWidget();
          Future.delayed(Duration(milliseconds: 377), () {
            Navigator.pop(context);
            Future.delayed(Duration(milliseconds: 144), () {
              triggerEvent(Trigger.publicNameUpdate);
            });
          });
        });
      } else {
        saveValue(StorageKey.publicName, previousName);
      }
    }
  }

  @override
  void initState() {
    super.initState();
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
    currentWidget = NameTextField(
      () {
        onComplete();
      },
      textController,
    );
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
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.62,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'New public name',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(height: 12),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 233),
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
                    SizedBox(height: 12),
                    TextButton(
                      onPressed: () {
                        onComplete();
                      },
                      child: Text('continue'),
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

class NameTextField extends StatelessWidget {
  final Function onComplete;
  final TextEditingController controller;
  NameTextField(
    this.onComplete,
    this.controller,
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: true,
      onEditingComplete: () {
        onComplete();
      },
      style: TextStyle(
        color: Theme.of(context).focusColor,
      ),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Theme.of(context).focusColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Theme.of(context).focusColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Theme.of(context).focusColor),
        ),
        labelStyle: TextStyle(
          color: Theme.of(context).focusColor,
        ),
        hoverColor: Theme.of(context).focusColor,
        fillColor: Theme.of(context).focusColor,
        focusColor: Theme.of(context).focusColor,
      ),
      cursorColor: Theme.of(context).focusColor,
    );
  }
}

class NameReadyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.check_circle_outline_rounded,
      color: Theme.of(context).focusColor,
      size: 42,
    );
  }
}
