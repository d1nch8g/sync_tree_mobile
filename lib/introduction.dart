import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../src/src.dart';

Future<String> generateKeys(bool start) async {
  var keys = Keys.generate();
  return keys.allKeysString;
}

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    compute(generateKeys, true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: IntroductionScreen(
          pages: <PageViewModel>[
            PageViewModel(
              title: 'Hello!',
              image: Icon(
                Icons.info_rounded,
                size: MediaQuery.of(context).size.width * 0.40,
                color: Theme.of(context).focusColor,
              ),
              body: 'Here you can get a brief explanation of what'
                  'is going in this app, and how it works!',
              decoration: PageDecoration(
                titleTextStyle: Theme.of(context).textTheme.headline1!,
                bodyTextStyle: Theme.of(context).textTheme.headline2!,
              ),
              footer: TextButton(
                onPressed: () {},
                child: Text('next'),
              ),
            ),
            PageViewModel(
              title: "Title of first page",
              body:
                  "Here you can write the description of the page, to explain someting...",
            ),
            PageViewModel(
              title: "Title of first page",
              body:
                  "Here you can write the description of the page, to explain someting...",
            ),
            PageViewModel(
              title: "Title of first page",
              body:
                  "Here you can write the description of the page, to explain someting...",
            ),
            PageViewModel(
              title: "Title of first page",
              body:
                  "Here you can write the description of the page, to explain someting...",
            ),
            PageViewModel(
              title: "Title of first page",
              body:
                  "Here you can write the description of the page, to explain someting...",
            ),
          ],
          animationDuration: 387,
          showDoneButton: false,
          showNextButton: false,
          isTopSafeArea: true,
          isBottomSafeArea: true,
          dotsDecorator: DotsDecorator(
            size: const Size.square(8.0),
            activeSize: const Size(25.0, 8.0),
            activeColor: Theme.of(context).focusColor,
            color: Theme.of(context).focusColor,
            spacing: const EdgeInsets.symmetric(horizontal: 4.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
