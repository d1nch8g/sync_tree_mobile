import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/markets/list.dart';
import 'package:sync_tree_mobile_ui/markets/logo.dart';
import 'package:sync_tree_mobile_ui/markets/norez.dart';
import 'package:sync_tree_mobile_ui/markets/textField.dart';
import 'package:sync_tree_mobile_ui/src/local/storage.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';

class MarketPage extends StatefulWidget {
  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focuser = FocusNode();

  Widget mainSearchWidget = Center();

  void updateMarketList() async {
    try {
      var markets = await InfoCalls.searchMarkets(controller.text);
      if (markets.length == 0) {
        setState(() {
          mainSearchWidget = NoSearchResults();
        });
      } else {
        setState(() {
          mainSearchWidget = MarketList(marketAdresses: markets);
        });
      }
    } catch (e) {
      setState(() {
        mainSearchWidget = ConnectionError();
      });
    }
  }

  void loadCachedSearch() async {
    controller.text = await Storage.loadSeachCache();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadCachedSearch();
    updateMarketList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          MarketLogo(),
          Divider(),
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 144),
              child: mainSearchWidget,
            ),
          ),
          Divider(),
          MarketTextField(
            controller: controller,
            focuser: focuser,
            updateMarketList: () {
              updateMarketList();
            },
          ),
        ],
      ),
    );
  }
}
