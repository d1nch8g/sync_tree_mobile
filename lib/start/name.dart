import 'package:flutter/material.dart';
import 'package:sync_tree_modile_ui/src/src.dart';

class NameCreation extends StatefulWidget {
  @override
  _NameCreationState createState() => _NameCreationState();
}

class _NameCreationState extends State<NameCreation> {
  final nameController = TextEditingController();

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
              'You can set another one later in the settings.',
              textAlign: TextAlign.center,
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
              var nameCreationError = Filter.operateCheck(nameController.text);
              if (nameCreationError == '') {
                Storage.savePublicName(nameController.text);
                Navigator.pushNamed(context, '/keys');
              } else {
                showDialog(
                  context: context,
                  builder: (_) => NameErrorOverlay(
                    errorMessage: nameCreationError,
                  ),
                );
              }
            },
          ),
          SizedBox(height: 125),
        ],
      ),
    );
  }
}

class NameErrorOverlay extends StatefulWidget {
  final String errorMessage;
  NameErrorOverlay({required this.errorMessage});
  @override
  State<StatefulWidget> createState() => NameErrorOverlayState();
}

class NameErrorOverlayState extends State<NameErrorOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

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
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.72,
            decoration: ShapeDecoration(
              color: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.error_outline_rounded,
                    size: 144,
                    color: Theme.of(context).focusColor,
                  ),
                  Text(
                    this.widget.errorMessage,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    child: Text(
                      'retry',
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
