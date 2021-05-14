import 'package:flutter/material.dart';
import 'package:wallet_app/_reusable/colors.dart';

class AssetInfo extends StatelessWidget {
  final double paramsFonSize = 19;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Row(
            children: [
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(22, 2, 12, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Buy: 12345',
                        style: TextStyle(
                          fontSize: paramsFonSize,
                          color: palette.textColor,
                        ),
                      ),
                      Text(
                        'Sell: 12345',
                        style: TextStyle(
                          fontSize: paramsFonSize,
                          color: palette.textColor,
                        ),
                      ),
                      Text(
                        'Volume: 1232',
                        style: TextStyle(
                          fontSize: paramsFonSize,
                          color: palette.textColor,
                        ),
                      ),
                      Text(
                        'Rate: 4.98',
                        style: TextStyle(
                          fontSize: paramsFonSize,
                          color: palette.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
                child: Container(
                  color: palette.dividerColor,
                  height: 82,
                  width: 1,
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(22, 2, 2, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Orders: 98',
                        style: TextStyle(
                          fontSize: paramsFonSize,
                          color: palette.textColor,
                        ),
                      ),
                      Text(
                        'Vendor: SWH',
                        style: TextStyle(
                          fontSize: paramsFonSize,
                          color: palette.textColor,
                        ),
                      ),
                      Text(
                        'Deposit fee: 0.1%',
                        style: TextStyle(
                          fontSize: paramsFonSize,
                          color: palette.textColor,
                        ),
                      ),
                      Text(
                        'Withdrawal fee: 0.4%',
                        style: TextStyle(
                          fontSize: paramsFonSize,
                          color: palette.textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: palette.dividerColor,
            height: 6,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(22, 2, 12, 8),
            child: Text(
              'Description',
              style: TextStyle(
                fontSize: 18,
                color: palette.textColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(22, 2, 12, 8),
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
              style: TextStyle(
                fontSize: 18,
                color: palette.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
