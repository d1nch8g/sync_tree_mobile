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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Text(
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
        ),
        Divider(
          color: Theme.of(context).focusColor,
          indent: 8,
          endIndent: 8,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: SingleChildScrollView(
              child: Text(
                info.description,
                style: Theme.of(context).textTheme.bodyText2,
                softWrap: true,
                overflow: TextOverflow.fade,
              ),
            ),
          ),
        ),
        Divider(
          color: Theme.of(context).focusColor,
          indent: 8,
          endIndent: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingButton(
              closeContainer: closeContainer,
            ),
            DetachButton(),
          ],
        )
      ],
    );
  }
}

class DetachButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text('detach'),
      onPressed: () {},
    );
  }
}
