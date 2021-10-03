import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/market/list.dart';
import 'package:sync_tree_mobile_ui/market/logo.dart';
import 'package:sync_tree_mobile_ui/market/norez.dart';
import 'package:sync_tree_mobile_ui/market/input.dart';
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
  double height = 0;
  double bottomNavBarPadHeight = 0;
  List<String> markets = [];
  int connected = 0;
  int owned = 0;

  void updateMarketList() async {
    try {
      controller.text = await Storage.loadSeachCache();
      markets = await InfoCalls.searchMarkets(controller.text);
      connected = 0;
      owned = 0;
      if (markets.length == 0) {
        setState(() {
          mainSearchWidget = NoSearchResults();
        });
      } else {
        setState(() {
          mainSearchWidget = MarketList(
            key: UniqueKey(),
            marketAdresses: markets,
          );
        });
        markets.forEach((element) async {
          if (await Storage.checkIfMarketConnected(element)) {
            connected += 1;
          }
          var bal = await Storage.loadMarketBalance(element);
          if (bal != 0) {
            owned += 1;
          }
        });
      }
    } catch (e) {
      setState(() {
        mainSearchWidget = ConnectionError();
      });
    }
  }

  updateBottomHeight() async {
    bottomNavBarPadHeight = await Storage.loadBottomPadding();
  }

  @override
  void initState() {
    super.initState();
    updateMarketList();
    updateBottomHeight();
  }

  @override
  Widget build(BuildContext context) {
    var kbsize = MediaQuery.of(context).viewInsets.bottom;
    if (kbsize > 0) {
      kbsize = kbsize - kBottomNavigationBarHeight - bottomNavBarPadHeight;
    }
    return SafeArea(
      child: Column(
        children: [
          MarketLogo(
            marketAdresses: markets,
            connected: connected,
            owned: owned,
          ),
          Divider(color: Theme.of(context).primaryColorDark),
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
            curve: Curves.easeOutCubic,
            height: kbsize,
          ),
        ],
      ),
    );
  }
}
