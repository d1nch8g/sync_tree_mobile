import 'package:flutter/material.dart';
import 'package:sync_tree_mobile/api/userSearch.dart';

class WalletBox extends StatelessWidget {
  final Market market;
  WalletBox(this.market);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.36,
      color: Theme.of(context).focusColor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              // this one should be opened
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                color: Theme.of(context).backgroundColor,
              ),
              height: MediaQuery.of(context).size.width * 0.36,
              width: MediaQuery.of(context).size.width * 0.74,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          market.name,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        Divider(),
                        Text(
                          'balance',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).focusColor,
                shape: BoxShape.circle,
              ),
              width: MediaQuery.of(context).size.width * 0.28,
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.22,
                  child: Image.network(market.img),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
