import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/net/info_calls.dart';
import 'package:sync_tree_modile_ui/market/marketModal.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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
    this.markets.clear();
    marketAdresses.forEach((marketAdress) async {
      var info = await InfoCalls.marketInfo(marketAdress);
      setState(() {
        this.markets.add(info);
      });
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
            onEditingComplete: () {
              updateMarketList();
              FocusScope.of(context).unfocus();
            },
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
        AnimatedSwitcher(
          child: MarketTileList(
            markets: markets,
            key: UniqueKey(),
          ),
          duration: Duration(milliseconds: 377),
        ),
      ],
    );
  }
}

class MarketTileList extends StatelessWidget {
  final List<MarketInfo> markets;
  final Key key;
  MarketTileList({required this.markets, required this.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: markets.length,
      padding: EdgeInsets.all(3.0),
      itemBuilder: (context, index) {
        var mkt = markets[index];
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Image.network(mkt.imageLink),
              onTap: () {
                showMaterialModalBottomSheet(
                  context: context,
                  builder: (context) => MarketModalSheet(),
                );
              },
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    mkt.name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                    'count: ' + mkt.operationCount.toString() + '  ',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
              subtitle: Text(
                mkt.description.substring(0, 100) + '...',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Divider(
              color: Theme.of(context).cardColor,
            )
          ],
        );
      },
    );
  }
}
