import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';
import 'package:sync_tree_mobile_ui/wallet/page/chat/chat_box.dart';
import 'package:sync_tree_mobile_ui/wallet/page/chat/chat_input.dart';
import 'package:sync_tree_mobile_ui/wallet/page/chat/deposit.dart';
import 'package:sync_tree_mobile_ui/wallet/page/chat/withdrawal.dart';
import 'package:sync_tree_mobile_ui/wallet/page/frame.dart';

class DepositPage extends StatelessWidget {
  final MarketInfo info;
  final Function closeContainer;
  DepositPage({
    required this.info,
    required this.closeContainer,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChatMessages(
          adress: info.adress,
          delimiter: info.delimiter,
        ),
        SizedBox(height: 8),
        ChatTextField(
          marketMesKey: Uint8List.fromList(info.messageKey),
          marketAdress: info.adress,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Center(
                child: DepositButton(info: info),
              ),
            ),
            FloatingButton(
              closeContainer: closeContainer,
            ),
            Expanded(
              child: Center(
                child: WithdrawalButton(info: info),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
