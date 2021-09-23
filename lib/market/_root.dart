import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../src/src.dart';
import '../connection.dart';
import '../market/marketPage.dart';
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
      if (marketAdresses.length == 0) {
        setState(() {
          marketsWidget = NoSearchResults();
        });
      }
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
    Future.delayed(Duration(milliseconds: 34), () {
      updateMarketList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadSearchCache();
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
          Divider(),
          Expanded(
            child: AnimatedSwitcher(
              child: marketsWidget,
              duration: Duration(milliseconds: 377),
            ),
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
        // shrinkWrap: true,
        itemCount: markets.length + 1,
        padding: EdgeInsets.all(3.0),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Divider(
              color: Theme.of(context).cardColor,
            );
          }
          var info = markets[index - 1];
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Image.network(info.imageLink),
                //     CachedNetworkImage(
                //   imageUrl: info.imageLink,
                //   placeholder: (context, url) => CircularProgressIndicator(),
                //   errorWidget: (context, url, error) => Icon(Icons.error),
                // ),
                onTap: () {
                  showMaterialModalBottomSheet(
                    context: context,
                    builder: (context) => MarketModalSheet(
                      info: info,
                    ),
                  );
                },
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      info.name,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    DynamicBalance(adress: info.adress),
                  ],
                ),
                subtitle: Text(
                  info.description.substring(0, 85),
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
            size: MediaQuery.of(context).size.width * 0.32,
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

class DynamicBalance extends StatefulWidget {
  final String adress;
  DynamicBalance({required this.adress});
  @override
  _DynamicBalanceState createState() => _DynamicBalanceState();
}

class _DynamicBalanceState extends State<DynamicBalance> {
  late String balance = '0';

  updateBalance() async {
    balance = (await Storage.loadMarketBalance(widget.adress)).toString();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    updateBalance();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      balance,
      style: Theme.of(context).textTheme.headline5,
    );
  }
}
