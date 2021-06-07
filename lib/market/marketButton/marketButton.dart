import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:sync_tree_mobile/_reusable/colors.dart';
import 'package:sync_tree_mobile/_reusable/toRemoveLoadedData.dart';

import '../../_reusable/buttonImage.dart';
import 'modalAssetPage/modalPage.dart';
import '../../_reusable/buttonStar.dart';

class MarketButton extends StatefulWidget {
  final String assetName;
  final Key key;

  MarketButton({
    this.assetName,
    this.key,
  });

  @override
  _MarketButtonState createState() => _MarketButtonState();
}

class _MarketButtonState extends State<MarketButton> {
  final Color backgroundColor = palette.buttonsColor;
  final Color itemColor = palette.smallItemsColor;
  final Color textColor = palette.textColor;
  String exchange = '-';
  String price = '0';
  String rate = 'loading';
  String withdrawal = '0';
  String deposit = '0';

  setParameters() {
    var data = assetData[widget.assetName] ??
        {
          'exchange': '-',
          'rate': '0',
          'price': 'loading',
          'withdrawal': '0',
          'deposit': '0'
        };
    exchange = data['exchange'] ?? '-';
    price = data['price'] ?? '0';
    rate = data['rate'] ?? 'loading';
    withdrawal = data['withdrawal'] ?? '0';
    deposit = data['deposit'] ?? '0';
  }

  @override
  void initState() {
    super.initState();
    setParameters();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(4, 5, 4, 5),
      child: ElevatedButton(
        child: IntrinsicHeight(
          child: Row(
            children: [
              MarketButtonStar(
                assetName: widget.assetName,
                key: UniqueKey(),
              ),
              MarketButtonImage(
                assetName: widget.assetName,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 12),
                      Text(
                        widget.assetName,
                        style: TextStyle(
                          fontSize: 16,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  VerticalDivider(
                    width: 1,
                    color: Colors.white,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 12),
                      Text(
                        exchange,
                        style: TextStyle(
                          fontSize: 12,
                          color: palette.dividerColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            price + ' SWP',
                            style: TextStyle(
                              fontSize: 16,
                              color: palette.smallItemsColor,
                            ),
                          ), //TODO запулить цену внесения и вынесения активов
                          Text(
                            'D: ' + deposit + '%/ W: ' + withdrawal + '%',
                            style: TextStyle(
                              fontSize: 12,
                              color: palette.dividerColor,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 12,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.fromLTRB(4, 5, 4, 5),
          side: BorderSide(width: 1.0, color: palette.buttonEdgesColor),
          primary: backgroundColor,
          onPrimary: itemColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) => ModalMarketPage(
              assetName: widget.assetName,
            ),
          );
        },
      ),
    );
  }
}
