import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/net/info_calls.dart';
import 'package:sync_tree_mobile_logic/net/user_calls.dart';

class MarketPage extends StatelessWidget {
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
          SearchBlock(),
        ],
      ),
    );
  }
}

class SearchBlock extends StatefulWidget {
  @override
  State<SearchBlock> createState() => _SearchBlockState();
}

class _SearchBlockState extends State<SearchBlock> {
  final TextEditingController searchController = TextEditingController();
  List<MarketInfo> markets = [];

  updateMarketList() async {
    var marketAdresses = await InfoCalls.searchMarkets(searchController.text);
    markets.clear();
    marketAdresses.forEach((marketAdress) async {
      var info = await InfoCalls.marketInfo(marketAdress);
      markets.add(info);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
            style: TextStyle(
              color: Theme.of(context).cardColor,
            ),
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Theme.of(context).cardColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Theme.of(context).cardColor),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Theme.of(context).cardColor),
              ),
              labelStyle: TextStyle(
                color: Theme.of(context).cardColor,
              ),
              labelText: 'name',
              hoverColor: Theme.of(context).cardColor,
              fillColor: Theme.of(context).cardColor,
              focusColor: Theme.of(context).cardColor,
            ),
            cursorColor: Theme.of(context).cardColor,
          ),
        ),
        MarketTileList(markets: markets)
      ],
    );
  }
}

class MarketTileList extends StatelessWidget {
  List<MarketInfo> markets;
  MarketTileList({required this.markets});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
