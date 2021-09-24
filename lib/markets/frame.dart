import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/markets/logo.dart';
import 'package:sync_tree_mobile_ui/markets/norez.dart';
import 'package:sync_tree_mobile_ui/markets/textField.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';

class MaretPage extends StatefulWidget {
  @override
  State<MaretPage> createState() => _MaretPageState();
}

class _MaretPageState extends State<MaretPage> {
  final TextEditingController controller = TextEditingController();
  final FocusNode focuser = FocusNode();

  Widget mainSearchWidget = Center();
  List<MarketInfo> markets = [];

  void updateMarketList() async {
    try {
      var markets = await InfoCalls.searchMarkets(controller.text);
      if (markets.length == 0) {
        setState(() {
          mainSearchWidget = NoSearchResults();
        });
      } else {
        
      }
    } catch (e) {
      setState(() {
        mainSearchWidget = ConnectionError();
      });
    }
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
          MarketLogo(),
          Divider(),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 144),
            child: mainSearchWidget,
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
