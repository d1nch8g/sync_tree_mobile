library bad_words;

import 'package:flutter/material.dart';

import 'words.dart';

/// Bad Word Filter
class Filter {
  bool isProfane(String stringToTest) {
    final lowerCaseStringToTest = stringToTest.toLowerCase();
    return wordList
        .where((word) => lowerCaseStringToTest.contains(word))
        .isNotEmpty;
  }

  String clean(String stringToObfuscate) {
    final listToTest = stringToObfuscate.split(' ');
    final clean = listToTest.map((e) {
      if (wordSet.contains(e.toLowerCase())) {
        return e.replaceAll(RegExp('.'), '*');
      }
      return e;
    });

    return clean.join(' ');
  }

  bool isShort(String name) {
    if (name.length < 4) {
      return true;
    }
    return false;
  }

  bool containBadCharacters(String name) {
    if (name.contains(' ')) {
      return true;
    }
    if (RegExp('[a-zA-Z0-9]').hasMatch(name)) {
      return false;
    }
    return true;
  }

  bool tooLong(String name) {
    if (name.length > 16) {
      return true;
    }
    return false;
  }

  bool operateCheck(TextEditingController nameController, context) {
    if (isProfane(nameController.text)) {
      nameController.text = '';
      showDialog(
        context: context,
        builder: (_) => BadNameOverlay(
          mainText: 'name contains profane words',
        ),
      );
      return false;
    }
    if (isShort(nameController.text)) {
      nameController.text = '';
      showDialog(
        context: context,
        builder: (_) => BadNameOverlay(
          mainText: 'name is too short',
        ),
      );
      return false;
    }
    if (containBadCharacters(nameController.text)) {
      nameController.text = '';
      showDialog(
        context: context,
        builder: (_) => BadNameOverlay(
          mainText: 'name contains bad letters',
        ),
      );
      return false;
    }
    if (tooLong(nameController.text)) {
      nameController.text = '';
      showDialog(
        context: context,
        builder: (_) => BadNameOverlay(
          mainText: 'name is too long',
        ),
      );
      return false;
    }
    return true;
  }
}

class BadNameOverlay extends StatefulWidget {
  final String mainText;
  BadNameOverlay({this.mainText = 'error'});
  @override
  State<StatefulWidget> createState() => BadNameOverlayState();
}

class BadNameOverlayState extends State<BadNameOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

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
              padding: const EdgeInsets.all(50.0),
              child: Text(
                this.widget.mainText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
