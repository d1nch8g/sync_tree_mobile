import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/local/balance.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';

class InfoPage extends StatefulWidget {
  final MarketInfo info;
  InfoPage({required this.info});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            'Input fee: ${widget.info.inputFee / 100}%\n'
            'Buys count: ${widget.info.activeBuys}\n'
            'Operations: ${widget.info.operationCount}\n'
            'Output fee: ${widget.info.outputFee / 100}%\n'
            'Sells count: ${widget.info.activeSells}\n'
            '${widget.info.workTime}',
            style: Theme.of(context).textTheme.bodyText2,
            softWrap: true,
            overflow: TextOverflow.fade,
          ),
          flex: 7,
        ),
        Divider(
          color: Theme.of(context).focusColor,
        ),
        Expanded(
          child: Text(
            widget.info.description,
            style: Theme.of(context).textTheme.bodyText2,
            softWrap: true,
            overflow: TextOverflow.fade,
          ),
          flex: 18,
        ),
      ],
    );
  }
}
