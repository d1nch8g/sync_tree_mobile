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
      body: IntroductionScreen(
        freeze: true,
        pages: <PageViewModel>[
          PageViewModel(
            title: 'Hello!',
            image: Icon(
              Icons.info_rounded,
              size: MediaQuery.of(context).size.width * 0.40,
              color: Theme.of(context).focusColor,
            ),
            body: 'Here you can get a brief explanation of what '
                'is going on in this app, and how it works.',
            decoration: PageDecoration(
              titleTextStyle: Theme.of(context).textTheme.headline1!,
              bodyTextStyle: Theme.of(context).textTheme.headline2!,
            ),
          ),
          PageViewModel(
            title: 'Search',
            image: Icon(
              Icons.manage_search_rounded,
              size: MediaQuery.of(context).size.width * 0.40,
              color: Theme.of(context).focusColor,
            ),
            body: 'You can search for different markets using '
                'built in search engine.',
            decoration: PageDecoration(
              titleTextStyle: Theme.of(context).textTheme.headline1!,
              bodyTextStyle: Theme.of(context).textTheme.headline2!,
            ),
          ),
          PageViewModel(
            title: 'Wallets',
            image: Icon(
              Icons.account_balance_wallet_rounded,
              size: MediaQuery.of(context).size.width * 0.40,
              color: Theme.of(context).focusColor,
            ),
            body: 'When you found market suitable for yourself, '
                'you can connect it as a wallet.',
            decoration: PageDecoration(
              titleTextStyle: Theme.of(context).textTheme.headline1!,
              bodyTextStyle: Theme.of(context).textTheme.headline2!,
            ),
          ),
          PageViewModel(
            title: 'Balance',
            image: Icon(
              Icons.input_rounded,
              size: MediaQuery.of(context).size.width * 0.40,
              color: Theme.of(context).focusColor,
            ),
            body: 'Each time you process deposit or withdrawal '
                'operation, you interact directly with that market '
                'using messages stored in blockchain in encrypted way.',
            decoration: PageDecoration(
              titleTextStyle: Theme.of(context).textTheme.headline1!,
              bodyTextStyle: Theme.of(context).textTheme.headline2!,
            ),
          ),
          PageViewModel(
            title: 'Trade',
            image: Icon(
              Icons.query_stats_rounded,
              size: MediaQuery.of(context).size.width * 0.40,
              color: Theme.of(context).focusColor,
            ),
            body: 'You can buy or sell any asset using built in '
                'sync tree token. Fee for any trade operation is 0% '
                '(yes, it is completely free).',
            decoration: PageDecoration(
              titleTextStyle: Theme.of(context).textTheme.headline1!,
              bodyTextStyle: Theme.of(context).textTheme.headline2!,
            ),
          ),
          PageViewModel(
            title: 'Security',
            image: Icon(
              Icons.shield_rounded,
              size: MediaQuery.of(context).size.width * 0.40,
              color: Theme.of(context).focusColor,
            ),
            body: 'Only owner of private key can process changes in '
                'blockchain. Keep your private key in safe and '
                'secure place.',
            decoration: PageDecoration(
              titleTextStyle: Theme.of(context).textTheme.headline1!,
              bodyTextStyle: Theme.of(context).textTheme.headline2!,
            ),
          ),
          PageViewModel(
            title: 'Threats',
            image: Icon(
              Icons.dangerous_rounded,
              size: MediaQuery.of(context).size.width * 0.40,
              color: Theme.of(context).focusColor,
            ),
            body: 'Deceivers can try to create markets that are looking '
                'similar to original. Double check each market you '
                'interact with. Do not process any transactions on '
                'untrusted markets!',
            decoration: PageDecoration(
              titleTextStyle: Theme.of(context).textTheme.headline1!,
              bodyTextStyle: Theme.of(context).textTheme.headline2!,
            ),
          ),
          PageViewModel(
            title: 'Names',
            image: Icon(
              Icons.supervised_user_circle_rounded,
              size: MediaQuery.of(context).size.width * 0.40,
              color: Theme.of(context).focusColor,
            ),
            body: 'Each user and market name in this system is '
                'unique! Name check is a true way of identity verification. ',
            decoration: PageDecoration(
              titleTextStyle: Theme.of(context).textTheme.headline1!,
              bodyTextStyle: Theme.of(context).textTheme.headline2!,
            ),
          ),
        ],
        animationDuration: 387,
        showNextButton: true,
        next: Text('next'),
        nextFlex: 35,
        showDoneButton: true,
        done: Text('done'),
        onDone: () {
          Navigator.pushNamed(context, '/main');
          Future.delayed(Duration(milliseconds: 144), () {
            showDialog(
              context: context,
              builder: (_) => NameAndKeyOverlay(),
              barrierDismissible: false,
            );
          });
        },
        skipFlex: 0,
        dotsFlex: 86,
        dotsDecorator: DotsDecorator(
          size: const Size.square(8.0),
          activeSize: const Size(25.0, 8.0),
          activeColor: Theme.of(context).focusColor,
          color: Theme.of(context).focusColor,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        controlsPadding: EdgeInsets.all(28),
      ),
    );
  }
}

class NameAndKeyOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NameAndKeyOverlayState();
}

class NameAndKeyOverlayState extends State<NameAndKeyOverlay>
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
                    'coca cola',
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
