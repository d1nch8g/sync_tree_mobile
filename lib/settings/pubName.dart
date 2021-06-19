import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../security/pin.dart';
import '../security/filter.dart';

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
      var prefs = await SharedPreferences.getInstance();
      prefs.setString('pubName', textController.text);
      print('changed');
    }
  }

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
    currentWidget = NameChangeAsker(
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

class NameChangeAsker extends StatelessWidget {
  final Function onComplete;
  final TextEditingController controller;
  NameChangeAsker(
    this.onComplete,
    this.controller,
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.62,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'New public name',
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(height: 12),
          TextField(
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
    );
  }
}
