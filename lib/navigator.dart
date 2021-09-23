import 'package:flutter/material.dart';
import '../src/src.dart';

import 'market/_root.dart';
import 'wallet/_root.dart';
import 'settings/_root.dart';
import 'start/hello.dart';
import 'start/name.dart';
import 'start/keys.dart';

var firstLaunchRoutMap = <String, WidgetBuilder>{
  '/main': (BuildContext context) => PrimaryPage(),
  '/hello': (BuildContext context) => IntroPage(),
  '/name': (BuildContext context) => NameCreation(),
  '/keys': (BuildContext context) => KeySave(),
};

updateSelfInformation() async {
  var keys = await Storage.loadKeys();
  var info = await InfoCalls.userInfo(
    keys.personal.public.getAdressBase64(),
  );
  Storage.updateSelfInformation(info: info);
}

class PrimaryPage extends StatefulWidget {
  @override
  _PrimaryPageState createState() => _PrimaryPageState();
}

class _PrimaryPageState extends State<PrimaryPage> {
  int bottomBarIndex = 1;
  late PageController bottomBarController;

  void checkFirstLaunch() async {
    var isFirstLaunch = await Storage.checkIfFirstLaunch();
    if (isFirstLaunch) {
      Navigator.pushNamed(context, '/hello');
    }
  }

  @override
  void dispose() {
    bottomBarController.dispose();
    super.dispose();
  }

  void onTap(int index) {
    setState(() {
      bottomBarIndex = index;
      bottomBarController.animateToPage(
        index,
        duration: Duration(milliseconds: 320),
        curve: Curves.easeOut,
      );
    });
  }

  moveToSearchPage() {
    setState(() {
      bottomBarIndex = 0;
      bottomBarController.animateToPage(
        0,
        duration: Duration(milliseconds: 320),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    bottomBarController = PageController(
      initialPage: bottomBarIndex,
    );
    checkFirstLaunch();
    Storage.createTriggerSubscription(
      trigger: Trigger.moveToMarketPage,
      onTriggerEvent: () {
        moveToSearchPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).focusColor,
      body: SizedBox.expand(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: bottomBarController,
          onPageChanged: (index) {
            setState(() => bottomBarIndex = index);
          },
          children: <Widget>[
            MarketPage(),
            WalletPage(),
            SettingsPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        fixedColor: Theme.of(context).focusColor,
        unselectedItemColor: Theme.of(context).focusColor,
        currentIndex: bottomBarIndex,
        enableFeedback: true,
        onTap: onTap,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'markets',
            icon: Icon(Icons.query_stats_rounded),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          BottomNavigationBarItem(
            label: 'wallets',
            icon: Icon(Icons.account_balance_wallet_outlined),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          BottomNavigationBarItem(
            label: 'settings',
            icon: Icon(Icons.settings),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
        ],
      ),
    );
  }
}
