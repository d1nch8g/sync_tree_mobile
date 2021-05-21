import 'package:flutter/material.dart';
import 'package:sync_tree_mobile/_reusable/colors.dart';

import 'buySellButton/buySellButton.dart';
import 'assetInfo/assetInfo.dart';
import 'marketChart/marketChart.dart';

//non horizontal inheritances
import 'package:sync_tree_mobile/_reusable/buttonStar.dart';
import 'package:sync_tree_mobile/_reusable/buttonImage.dart';
import 'package:sync_tree_mobile/_reusable/dialogueTab.dart';

class ModalMarketPage extends StatelessWidget {
  final String assetName;
  ModalMarketPage({
    String this.assetName,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.92,
      decoration: new BoxDecoration(
        color: palette.appBarColor,
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(25.0),
          topRight: const Radius.circular(25.0),
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                width: 112,
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  color: Colors.grey[350],
                ),
              ),
            ),
          ),
          MarketChart(),
          Padding(
            padding: EdgeInsets.fromLTRB(6, 6, 0, 6),
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  MarketButtonStar(
                    assetName: assetName,
                    key: UniqueKey(),
                  ),
                  MarketButtonImage(
                    assetName: assetName,
                  ),
                  Text(
                    '  ' + assetName,
                    style: TextStyle(
                      color: palette.textColor,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: palette.dividerColor,
            height: 6,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(
            height: 10,
          ),
          AssetInfo(),
          SizedBox(
            height: 12,
          ),
          Divider(
            color: palette.dividerColor,
            height: 6,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(
            height: 12,
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BuySellButton(
                  text: 'BUY',
                  color: palette.buttonBuyColor,
                  onPressed: () async {
                    await Dialogue.showDialogFuncition(
                        context, Text('yo'), EdgeInsets.all(30));
                  },
                ),
                BuySellButton(
                  color: palette.buttonSellColor,
                  text: 'SELL',
                  onPressed: () async {
                    await Dialogue.showDialogFuncition(
                        context, Text('yo'), EdgeInsets.all(30));
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
