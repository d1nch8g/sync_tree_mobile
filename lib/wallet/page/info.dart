import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';
import 'package:sync_tree_mobile_ui/wallet/page/frame.dart';

class InfoPage extends StatelessWidget {
  final MarketInfo info;
  final Function closeContainer;
  InfoPage({
    required this.info,
    required this.closeContainer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Output fee: ${info.outputFee / 100}%\n'
                'Input fee:    ${info.inputFee / 100}%\n'
                'Operations: ${info.operationCount}\n'
                'Buys count: ${info.activeBuys}\n'
                'Sells count: ${info.activeSells}\n'
                'Workday: ${info.workTime}',
                style: Theme.of(context).textTheme.bodyText2,
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
              Divider(color: Theme.of(context).focusColor),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    info.description,
                    style: Theme.of(context).textTheme.bodyText2,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Material(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingButton(
                  closeContainer: closeContainer,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
