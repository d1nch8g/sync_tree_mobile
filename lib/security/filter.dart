library bad_words;

import 'package:flutter/material.dart';

import 'words.dart';

/// Bad Word Filter
class Filter {
  /// isProfane returns a boolean value representing if the string provided contains a profane word
  bool isProfane(String stringToTest) {
    final lowerCaseStringToTest = stringToTest.toLowerCase();
    return wordList
        .where((word) => lowerCaseStringToTest.contains(word))
        .isNotEmpty;
  }

  /// replace tests a string, replacing bad words with an asterisk length string of equal length
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

  bool checkLength(String name) {
    if (name.length < 4) {
      return false;
    }
    return true;
  }

  bool checkCharacters(String name) {
    if (name.contains(' ')) {
      return false;
    }
    if (RegExp('[a-zA-Z0-9]').hasMatch(name)) {
      return true;
    }
    return false;
  }

  bool operateCheck(
    TextEditingController nameController,
    context,
  ) {
    if (isProfane(nameController.text)) {
      nameController.text = '';
      showDialog(
        context: context,
        builder: (_) => BadNameOverlay(
          mainText: 'name contains\n'
              'profane words',
        ),
      );
      return false;
    }
    if (checkLength(nameController.text)) {
      nameController.text = '';
      showDialog(
        context: context,
        builder: (_) => BadNameOverlay(
          mainText: 'name is\n'
              'too short',
        ),
      );
      return false;
    }
    if (checkCharacters(nameController.text)) {
      nameController.text = '';
      showDialog(
        context: context,
        builder: (_) => BadNameOverlay(
          mainText: 'name contains\n'
              'bad letters\n',
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
