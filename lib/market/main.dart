import 'package:flutter/material.dart';
import 'package:sync_tree_mobile/api/userSearch.dart';

class MarketPage extends StatelessWidget {
  void getMarkets() async {
    var rez = await userSearch("bitcoin");
    print(rez);
  }

  @override
  Widget build(BuildContext context) {
    getMarkets();
    return Container(
      child: Center(
        child: Text('market'),
      ),
    );
  }
}
