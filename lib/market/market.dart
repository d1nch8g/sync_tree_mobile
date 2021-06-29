import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sync_tree_mobile/api/userSearch.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sync_tree_mobile/market/botBar.dart';

class MarketPage extends StatefulWidget {
  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  var marketList = [];
  var controller = TextEditingController();

  void getMarkets(context) async {
    var rez = await userSearch(controller.text);
    setState(() {
      marketList = rez;
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
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: Icon(
              Icons.stacked_bar_chart_sharp,
              size: MediaQuery.of(context).size.height * 0.15,
              color: Theme.of(context).hintColor,
            ),
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
            child: AnimatedList(
              initialItemCount: marketList.length,
              itemBuilder: (context, idx, animation) {
                return SlideTransition(
                  position: animation.drive(
                    Tween<Offset>(
                      begin: const Offset(0.0, 0.0),
                      end: const Offset(0.0, 0.0),
                    ),
                  ),
                  child: ListTile(
                    title: Text(marketList[idx][MarketInfo.name] ?? ''),
                    subtitle:
                        Text(marketList[idx][MarketInfo.description] ?? ''),
                    leading: Image.network(
                        marketList[idx][MarketInfo.imgLink] ?? ''),
                    trailing: Text(marketList[idx][MarketInfo.opCount] ?? ''),
                    onTap: () {
                      showMaterialModalBottomSheet(
                        context: context,
                        builder: (context) => SingleChildScrollView(
                          controller: ModalScrollController.of(context),
                          child: BottomStuff('hello'),
                        ),
                      );
                    },
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
