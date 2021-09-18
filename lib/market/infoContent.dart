import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/net/info_calls.dart';
import 'package:sync_tree_mobile_logic/sync_tree_modile_logic.dart';

class InfoContent extends StatelessWidget {
  MarketInfo info;
  int mainBalance, marketBalance;
  InfoContent({
    required this.info,
    required this.mainBalance,
    required this.marketBalance,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 12, 22, 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Operation count: ' + info.operationCount.toString(),
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            'Active buys: ' + info.getAllBuys().length.toString(),
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            'Active sells: ' + info.getAllSells().length.toString(),
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            'Max buy: ' + mainBalance.toString(),
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            'Max sell: ' + marketBalance.toString(),
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            'Input fee: ' + info.inputFee.toString() + '%',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            'Output fee: ' + info.outputFee.toString() + '%',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            'Working time: ' + info.workTime,
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Divider(
            color: Theme.of(context).focusColor,
          ),
          Text(
            this.info.description,
            style: Theme.of(context).textTheme.subtitle2,
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    );
  }
}
