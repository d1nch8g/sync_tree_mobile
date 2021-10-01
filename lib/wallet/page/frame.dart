import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/local/storage.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';

class ConnectedWalletPage extends StatefulWidget {
  final MarketInfo info;
  final Function closeContainer;
  ConnectedWalletPage({
    required this.closeContainer,
    required this.info,
  });

  @override
  State<ConnectedWalletPage> createState() => _ConnectedWalletPageState();
}

bool resizekb = true;

class _ConnectedWalletPageState extends State<ConnectedWalletPage> {
  int bottomBarIndex = 0;
  late PageController bottomBarController;

  @override
  void dispose() {
    bottomBarController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    bottomBarController = PageController(
      initialPage: bottomBarIndex,
    );
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
    Storage.saveBottomPadding(padding: MediaQuery.of(context).padding.bottom);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      floatingActionButton: IconButton(
        icon: Icon(Icons.arrow_drop_down_circle_rounded),
        iconSize: 52,
        color: Theme.of(context).focusColor,
        onPressed: () {
          widget.closeContainer();
        },
      ),
      body: SizedBox.expand(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: bottomBarController,
          onPageChanged: (index) {
            setState(() => bottomBarIndex = index);
          },
          children: <Widget>[
            Container(color: Colors.purple),
            Container(color: Colors.white),
            Container(color: Colors.blue),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Theme.of(context).focusColor,
        unselectedItemColor: Theme.of(context).focusColor,
        currentIndex: bottomBarIndex,
        enableFeedback: true,
        onTap: onTap,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'information',
            icon: Icon(Icons.info_outlined),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          BottomNavigationBarItem(
            label: 'deposit',
            icon: Icon(Icons.change_circle_rounded),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
          BottomNavigationBarItem(
            label: 'market',
            icon: Icon(Icons.settings),
            backgroundColor: Theme.of(context).backgroundColor,
          ),
        ],
      ),
    );
  }
}
