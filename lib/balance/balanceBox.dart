import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animations/animations.dart';
import 'package:sync_tree_mobile/api/userSearch.dart';
import 'package:sync_tree_mobile/balance/balance.dart';

class BalanceBox extends StatefulWidget {
  final Market market;
  BalanceBox(this.market);

  @override
  _BalanceBoxState createState() => _BalanceBoxState();
}

class _BalanceBoxState extends State<BalanceBox> {
  late String curBalance = '';

  void initBalance() async {
    var prefs = await SharedPreferences.getInstance();
    var balance = prefs.getInt(base64.encode(this.widget.market.adress)) ?? 0;
    setState(() {
      curBalance = balance.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    initBalance();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.36,
      color: Theme.of(context).focusColor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: OpenContainer(
              transitionDuration: Duration(milliseconds: 377),
              closedBuilder: (context, action) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  color: Theme.of(context).hoverColor,
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            widget.market.name,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Text(
                            curBalance,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(3.2),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Theme.of(context).focusColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              openBuilder: (context, action) => BalancePage(),
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
                  child: Image.network(widget.market.img),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
