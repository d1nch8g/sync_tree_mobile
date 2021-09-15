import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/net/info_calls.dart';

class MarketModalSheet extends StatefulWidget {
  final MarketInfo info;
  MarketModalSheet({required this.info});

  @override
  State<MarketModalSheet> createState() => _MarketModalSheetState();
}

class _MarketModalSheetState extends State<MarketModalSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20.0),
          topRight: const Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 5,
                  width: 140,
                  decoration: BoxDecoration(
                    color: Theme.of(context).focusColor,
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.42),
          Row(
            children: [
              SizedBox(width: 22),
              Text(
                this.widget.info.name,
                style: Theme.of(context).textTheme.headline1,
              ),
            ],
          ),
          Divider(
            color: Theme.of(context).focusColor,
            indent: 12,
            endIndent: 12,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  this.widget.info.description,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
