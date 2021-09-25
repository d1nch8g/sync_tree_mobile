import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/market/list.dart';
import 'package:sync_tree_mobile_ui/market/logo.dart';
import 'package:sync_tree_mobile_ui/market/norez.dart';
import 'package:sync_tree_mobile_ui/market/text.dart';
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
      controller.text = await Storage.loadSeachCache();
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

  double height = 0;

  @override
  void initState() {
    super.initState();
    updateMarketList();
    focuser.addListener(() {
      // TODO figure out how to set appropriate resize size //
      if (height == 0) {
        height = 208;
      } else {
        height = 0;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          MarketLogo(),
          Divider(color: Theme.of(context).cardColor),
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 144),
              child: mainSearchWidget,
            ),
          ),
          MarketTextField(
            controller: controller,
            focuser: focuser,
            updateMarketList: () {
              updateMarketList();
            },
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 377),
            curve: Curves.ease,
            height: height,
          ),
        ],
      ),
    );
  }
}
