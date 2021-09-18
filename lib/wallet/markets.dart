import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/net/info_calls.dart';
import 'package:sync_tree_mobile_logic/sync_tree_modile_logic.dart';

class ConnectedMarketList extends StatelessWidget {
  final List<MarketInfo> markets;
  ConnectedMarketList({required this.markets});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: markets.length,
      itemBuilder: (context, index) {
        var info = markets[index];
        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: Stack(
            children: [
              Row(
                children: [
                  SizedBox(width: 110),
                  Container(
                    height: 126,
                    width: MediaQuery.of(context).size.width * 0.62,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(info.name),
                        Text(info.workTime),
                        Text(
                          'in fee: ${info.inputFee.toString()}% '
                          'out fee: ${info.outputFee.toString()}%',
                        ),
                        DynamicMarketBalance(adress: info.adress),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 63,
                    backgroundColor: Theme.of(context).focusColor,
                    child: Container(
                      child: Image.network(info.imageLink),
                      height: 102,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class DynamicMarketBalance extends StatefulWidget {
  final String adress;
  DynamicMarketBalance({required this.adress});
  @override
  _DynamicMarketBalanceState createState() => _DynamicMarketBalanceState();
}

class _DynamicMarketBalanceState extends State<DynamicMarketBalance> {
  String balance = '';
  void setBalance() async {
    balance = (await Storage.loadMarketBalance(widget.adress)).toString();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    setBalance();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Balance: $balance');
  }
}
