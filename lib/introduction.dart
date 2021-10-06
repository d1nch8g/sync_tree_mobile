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
            bodyWidget: TextField(
              controller: TextEditingController(),
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
            decoration: PageDecoration(
              titleTextStyle: Theme.of(context).textTheme.headline1!,
            ),
            footer: Text(
              'Each user and market name in this system is '
              'unique! Name check is a true way of identity verification. '
              'Pick your\'s.',
              style: Theme.of(context).textTheme.headline2,
              textAlign: TextAlign.center,
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
