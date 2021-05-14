import 'package:flutter/material.dart';

import 'package:wallet_app/_reusable/toRemoveLoadedData.dart';

import 'searchForm/searchForm.dart';
import 'marketButton/marketButton.dart';

class MarketPage extends StatefulWidget {
  MarketPageState createState() => MarketPageState();
}

class MarketPageState extends State<MarketPage> {
  final TextEditingController _textController = TextEditingController();
  final List<String> baseAssets = assetList;

  List<String> currentAssets = [];

  updateAssetListOnTyping(String value) {
    List<String> searchedAssets = [];
    for (int i = 0; i < baseAssets.length; i++) {
      if (baseAssets[i].toLowerCase().contains(value.toLowerCase())) {
        searchedAssets.add(baseAssets[i]);
      }
    }
    setState(() {
      currentAssets = searchedAssets;
    });
  }

  @override
  void initState() {
    currentAssets = baseAssets;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          SearchForm(
            textController: _textController,
            onItemChanged: updateAssetListOnTyping,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(2.0),
              children: currentAssets
                  .map((asset) =>
                      MarketButton(assetName: asset, key: UniqueKey()))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
