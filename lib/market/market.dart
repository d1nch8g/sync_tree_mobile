import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sync_tree_mobile/api/userSearch.dart';

class MarketPage extends StatefulWidget {
  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  var marketList = [];
  var controller = TextEditingController();

  void getMarkets() async {
    var rez = await userSearch(controller.text);
    setState(() {
      marketList = rez;
    });
  }

  void restoreLastSearch() async {
    var prefs = await SharedPreferences.getInstance();
    var lastSearch = prefs.getString('search');
    var rez = await userSearch(lastSearch ?? '');
    setState(() {
      marketList = rez;
    });
  }

  @override
  void initState() {
    restoreLastSearch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              onChanged: (_) async {
                getMarkets();
                var prefs = await SharedPreferences.getInstance();
                prefs.setString('search', controller.text);
              },
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Theme.of(context).buttonColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Theme.of(context).buttonColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Theme.of(context).buttonColor),
                ),
                labelStyle: TextStyle(
                  color: Theme.of(context).buttonColor,
                ),
                labelText: 'market search',
                hoverColor: Theme.of(context).buttonColor,
                fillColor: Theme.of(context).buttonColor,
                focusColor: Theme.of(context).buttonColor,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: marketList.length,
              itemBuilder: (context, idx) {
                return Hero(
                  tag: "market",
                  child: Container(
                    child: ListTile(
                      title: Text(marketList[idx][MarketInfo.name] ?? ''),
                      subtitle:
                          Text(marketList[idx][MarketInfo.description] ?? ''),
                      leading: Image.network(
                          marketList[idx][MarketInfo.imgLink] ?? ''),
                      trailing: Text(marketList[idx][MarketInfo.opCount] ?? ''),
                      onTap: () {
                        Navigator.pushNamed(context, '/market');
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
