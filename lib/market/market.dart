import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sync_tree_mobile/api/userSearch.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sync_tree_mobile/market/bar.dart';

class MarketPage extends StatefulWidget {
  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  List<Market> marketList = [];
  var controller = TextEditingController();

  void getMarkets(context) async {
    var rez = await searchMarketAdresses(controller.text);
    List<Market> listWithRecievedMarkets = [];
    for (var i = 0; i < rez.length; i++) {
      var market = await getMarketInformation(rez[i]);
      listWithRecievedMarkets.add(market);
    }
    setState(() {
      marketList = listWithRecievedMarkets;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Icon(
            Icons.stacked_line_chart_rounded,
            size: MediaQuery.of(context).size.height * 0.15,
            color: Theme.of(context).hintColor,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller,
              onChanged: (_) async {
                getMarkets(context);
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
            key: UniqueKey(),
            child: ListView.separated(
              itemCount: marketList.length,
              itemBuilder: (context, idx) {
                return ListTile(
                  title: Text(marketList[idx].name),
                  subtitle: Text(
                      marketList[idx].description.substring(0, 72) + '...'),
                  leading: Image.network(marketList[idx].img),
                  trailing: Text(marketList[idx].opCount.toString()),
                  onTap: () {
                    showMaterialModalBottomSheet(
                      context: context,
                      builder: (context) => SingleChildScrollView(
                        controller: ModalScrollController.of(context),
                        child: BottomBar(marketList[idx]),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, idx) {
                return Divider();
              },
            ),
          ),
        ],
      ),
    );
  }
}
