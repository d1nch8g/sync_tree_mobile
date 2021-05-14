import 'package:flutter/material.dart';
import 'package:wallet_app/_reusable/colors.dart';
import 'revieveSendButton/swapCoinButton.dart';
import 'package:wallet_app/_reusable/dialogueTab.dart';
import 'recievingAlert/recievingAlert.dart';
import 'sendingAlert/sendingAlert.dart';


class SwapCoinContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 9, 9, 9),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/SwapCoin.png',
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(
                          width: 9,
                        ),
                        Text(
                          'SwapCoin',
                          style: TextStyle(
                            fontSize: 28,
                            color: palette.textColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      'Balance: 1022',
                      style: TextStyle(
                        fontSize: 16,
                        color: palette.textColor,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Swaps: 4',
                      style: TextStyle(
                        fontSize: 16,
                        color: palette.textColor,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Transfers: 2',
                      style: TextStyle(
                        fontSize: 16,
                        color: palette.textColor,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    children: [
                      SwapCoinButton(
                        iconData: Icons.arrow_upward,
                        text: 'send',
                        onPressed: () async {
                          await Dialogue.showDialogFuncition(
                            context,
                            SendingDialogueBox(),
                            EdgeInsets.zero,
                          );
                        },
                      ),
                      SwapCoinButton(
                        iconData: Icons.arrow_downward,
                        text: 'recieve',
                        onPressed: () async {
                          await Dialogue.showDialogFuncition(
                            context,
                            RecievingDialogueBox(),
                            EdgeInsets.zero,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            color: palette.appBarColor,
            border: Border.all(
              color: palette.buttonBorderColor,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
