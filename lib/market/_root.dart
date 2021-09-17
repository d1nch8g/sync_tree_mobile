import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/net/info_calls.dart';
import 'package:sync_tree_mobile_logic/sync_tree_modile_logic.dart';
import 'package:sync_tree_modile_ui/connection.dart';
import 'package:sync_tree_modile_ui/market/marketPage.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MarketPage extends StatefulWidget {
  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  final TextEditingController searchController = TextEditingController();
  final FocusNode focuser = FocusNode();
  Widget marketsWidget = Center();

  updateMarketList() async {
    try {
      var marketAdresses = await InfoCalls.searchMarkets(searchController.text);
      Storage.saveSearchCache(searchController.text);
      List<MarketInfo> markets = [];
      marketAdresses.forEach((marketAdress) async {
        var info = await InfoCalls.marketInfo(marketAdress);
        markets.add(info);
        setState(() {
          marketsWidget = MarketTileList(
            markets: markets,
            key: UniqueKey(),
          );
        });
      });
      if (markets.length == 0) {
        marketsWidget = NoSearchResults();
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (_) => ConnectionErrorOverlay(
          errorMessage: 'Failed to search for markets!',
        ),
      );
    }
  }

  loadSearchCache() async {
    this.searchController.text = await Storage.loadSeachCache();
    updateMarketList();
  }

  @override
  void initState() {
    super.initState();
    loadSearchCache();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Icon(
                Icons.stacked_line_chart_rounded,
                size: MediaQuery.of(context).size.height * 0.15,
                color: Theme.of(context).hintColor,
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: TextField(
                  controller: searchController,
                  style: TextStyle(
                    color: Theme.of(context).cardColor,
                  ),
                  onEditingComplete: () async {
                    updateMarketList();
                    FocusScope.of(context).unfocus();
                    Storage.saveSearchCache(searchController.text);
                  },
                  focusNode: focuser,
                  cursorColor: Theme.of(context).cardColor,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide:
                          BorderSide(color: Theme.of(context).cardColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide:
                          BorderSide(color: Theme.of(context).cardColor),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide:
                          BorderSide(color: Theme.of(context).cardColor),
                    ),
                    labelStyle: TextStyle(
                      color: Theme.of(context).cardColor,
                    ),
                    labelText: 'type market name',
                    hoverColor: Theme.of(context).cardColor,
                    fillColor: Theme.of(context).cardColor,
                    focusColor: Theme.of(context).cardColor,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search_rounded),
                      color: Theme.of(context).cardColor,
                      onPressed: () {
                        updateMarketList();
                        FocusScope.of(context).unfocus();
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: AnimatedSwitcher(
                  child: marketsWidget,
                  duration: Duration(milliseconds: 377),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 18, 6),
              child: ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(focuser);
                },
                child: Icon(
                  Icons.keyboard_alt_outlined,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(33.0),
                  ),
                  padding: EdgeInsets.all(20),
                  primary: Theme.of(context).hoverColor,
                  onPrimary: Theme.of(context).focusColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MarketTileList extends StatelessWidget {
  final List<MarketInfo> markets;
  final Key key;
  MarketTileList({
    required this.markets,
    required this.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: markets.length + 1,
        padding: EdgeInsets.all(3.0),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Divider(
              color: Theme.of(context).cardColor,
            );
          }
          var mkt = markets[index - 1];
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Image.network(mkt.imageLink),
                onTap: () {
                  showMaterialModalBottomSheet(
                    context: context,
                    builder: (context) => MarketModalSheet(
                      info: mkt,
                    ),
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
                      'count: ' + mkt.operationCount.toString() + ' ',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
                subtitle: Text(
                  mkt.description.substring(0, 85),
                  maxLines: 2,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Divider(
                color: Theme.of(context).cardColor,
              ),
            ],
          );
        },
      ),
    );
  }
}

class NoSearchResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.search_off_rounded,
            size: MediaQuery.of(context).size.width * 0.24,
          ),
          SizedBox(
            height: 18,
          ),
          Text(
            'No search results.',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
