import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../_calls/infoMarket.dart';
import 'package:sync_tree_mobile/market/modal_root.dart';

class SearchModule extends StatefulWidget {
  @override
  _SearchModuleState createState() => _SearchModuleState();
}

class _SearchModuleState extends State<SearchModule> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  List<Market> markets = [];
  var controller = TextEditingController();

  void getMarkets(context) async {
    var rez = await searchMarketAdresses(
      context,
      controller.text,
    );
    var checkRez = rezToBase64(rez);
    for (var i = markets.length - 1; i >= 0; i--) {
      if (checkRez.contains(base64.encode(markets[i].adress))) {
        var rmIdx = checkRez.indexOf(base64.encode(markets[i].adress));
        rez.removeAt(rmIdx);
      } else {
        await removeItem(context, i);
      }
    }
    for (var i = 0; i < rez.length; i++) {
      var market = await getMarketInformation(context, rez[i]);
      await addItem(context, market);
    }
  }

  List<String> rezToBase64(List<Uint8List> rez) {
    List<String> newRez = [];
    rez.forEach((element) {
      newRez.add(base64.encode(element));
    });
    return newRez;
  }

  Future addItem(context, market) async {
    var indexToAdd = markets.length;
    markets.add(market);
    listKey.currentState?.insertItem(
      indexToAdd,
      duration: Duration(milliseconds: 144),
    );
    await sleep();
  }

  Future removeItem(context, index) async {
    Widget removeWidget = MarketTile(markets[index]);
    listKey.currentState?.removeItem(
      index,
      (context, animation) => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1, 0),
          end: const Offset(0, 0),
        ).animate(animation),
        child: removeWidget,
      ),
      duration: Duration(milliseconds: 144),
    );
    await sleep();
    markets.removeAt(index);
  }

  Future sleep() {
    return new Future.delayed(
      const Duration(milliseconds: 55),
      () => "1",
    );
  }

  SlideTransition itemBuild(index, animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 4),
        end: const Offset(0, 0),
      ).animate(animation),
      child: MarketTile(markets[index]),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              autofocus: true,
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
            child: AnimatedList(
              key: listKey,
              initialItemCount: markets.length,
              itemBuilder: (context, index, animation) {
                return itemBuild(index, animation);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MarketTile extends StatelessWidget {
  final Market market;
  MarketTile(this.market);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          minVerticalPadding: 4.5,
          contentPadding: EdgeInsets.all(8),
          title: Text(market.name),
          subtitle: Text(market.description.substring(0, 72) + '...'),
          leading: Image.network(market.img),
          trailing: Text(market.opCount.toString()),
          onTap: () {
            showMaterialModalBottomSheet(
              context: context,
              builder: (context) => SingleChildScrollView(
                controller: ModalScrollController.of(context),
                child: ModalMarketSheet(market),
              ),
            );
          },
        ),
        Divider(),
      ],
    );
  }
}

class SearchPreview extends StatelessWidget {
  final Function switchToSearch;
  SearchPreview(this.switchToSearch);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: () {
          switchToSearch();
        },
        icon: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).hoverColor,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.search_rounded),
        ),
        color: Theme.of(context).focusColor,
        iconSize: MediaQuery.of(context).size.width * 0.32,
      ),
    );
  }
}

class SearchBars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
