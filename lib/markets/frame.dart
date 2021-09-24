import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/markets/logo.dart';

class MaretPage extends StatefulWidget {
  @override
  State<MaretPage> createState() => _MaretPageState();
}

class _MaretPageState extends State<MaretPage> {
  TextEditingController controller = TextEditingController();
  Widget mainSearchWidget = Center();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          MarketLogo(),
          Divider(),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 144),
            child: mainSearchWidget,
          ),
          Divider(),
          
        ],
      ),
    );
  }
}
