import 'package:flutter/material.dart';
import 'package:sync_tree_mobile/api/userSearch.dart';

class MarketPage extends StatefulWidget {
  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  var sometext = '';
  void getMarkets() async {
    var rez = await userSearch("market");
    setState(() {
      sometext = rez;
    });
  }

  @override
  Widget build(BuildContext context) {
    getMarkets();
    return Container(
      child: Center(
        child: Text(sometext),
      ),
    );
  }
}
