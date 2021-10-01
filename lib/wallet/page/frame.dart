import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
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
  int curIdx = 0;
  final double iconSize = 36;
  final double spaceBetweenIcons = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: FloatingNavbar(
        backgroundColor: Theme.of(context).cardColor,
        currentIndex: curIdx,
        onTap: (index) {
          setState(() {
            curIdx = index;
          });
        },
        iconSize: 32,
        fontSize: 13.5,
        unselectedItemColor: Theme.of(context).focusColor,
        selectedItemColor: Theme.of(context).cardColor,
        selectedBackgroundColor: Theme.of(context).focusColor,
        items: [
          FloatingNavbarItem(
            icon: Icons.info,
            title: 'info',
          ),
          FloatingNavbarItem(
            icon: Icons.chat,
            title: 'deposit',
          ),
          FloatingNavbarItem(
            icon: Icons.query_stats_rounded,
            title: 'trade',
          ),
        ],
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.iconSize,
    required this.spaceBetweenIcons,
    required this.widget,
  }) : super(key: key);

  final double iconSize;
  final double spaceBetweenIcons;
  final ConnectedWalletPage widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 9),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.info),
          iconSize: iconSize,
          color: Colors.white,
        ),
        SizedBox(height: spaceBetweenIcons),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.chat),
          iconSize: iconSize,
          color: Colors.white,
        ),
        SizedBox(height: spaceBetweenIcons),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.query_stats_rounded),
          iconSize: iconSize,
          color: Colors.white,
        ),
        SizedBox(height: spaceBetweenIcons),
        IconButton(
          onPressed: () {
            widget.closeContainer();
          },
          icon: Icon(Icons.cancel_rounded),
          iconSize: iconSize,
          color: Colors.white,
        ),
      ],
    );
  }
}
