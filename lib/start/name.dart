import 'package:flutter/material.dart';
import 'package:bad_words/bad_words.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleAuth extends StatefulWidget {
  @override
  _GoogleAuthState createState() => _GoogleAuthState();
}

class _GoogleAuthState extends State<GoogleAuth> {
  final nameController = TextEditingController();
  final filter = Filter();

  saveName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('pubName', name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'pick a name',
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Text(
              'You can pick another one later in the settings.',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
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
                labelText: 'name',
                hoverColor: Theme.of(context).focusColor,
                fillColor: Theme.of(context).focusColor,
                focusColor: Theme.of(context).focusColor,
              ),
              cursorColor: Theme.of(context).focusColor,
            ),
          ),
          SizedBox(height: 23),
          TextButton(
            child: Text('continue'),
            onPressed: () {
              print(nameController.text);
              if (filter.isProfane(nameController.text)) {
                nameController.text = '';
                showDialog(
                  context: context,
                  builder: (_) =>
                      FunkyOverlay(message: 'name contains\nprofane words'),
                );
                return;
              }
              if (nameController.text.length < 4) {
                nameController.text = '';
                showDialog(
                  context: context,
                  builder: (_) =>
                      FunkyOverlay(message: ' name is\ntoo short'),
                );
                return;
              }
              if (nameController.text == 'dancheg97') {
                nameController.text = '';
                showDialog(
                  context: context,
                  builder: (_) =>
                      FunkyOverlay(message: 'no <3'),
                );
                return;
              }
              if (nameController.text == 'dancheg97 ') {
                nameController.text = 'dancheg97';
              }
              saveName(nameController.text);
              Navigator.pushNamed(context, '/keys');
            },
          ),
          SizedBox(
            height: 125,
          )
        ],
      ),
    );
  }
}

class FunkyOverlay extends StatefulWidget {
  final String message;
  FunkyOverlay({this.message = 'name error'});
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
              padding: const EdgeInsets.all(50.0),
              child: Text(
                this.widget.message,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
