import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_logic/net/info_calls.dart';
import 'package:sync_tree_mobile_logic/sync_tree_modile_logic.dart';

class MarketInfoOverlay extends StatefulWidget {
  final MarketInfo info;
  MarketInfoOverlay({required this.info});
  @override
  State<StatefulWidget> createState() => MarketInfoOverlayState();
}

class MarketInfoOverlayState extends State<MarketInfoOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 377),
    );
    scaleAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.90,
            decoration: ShapeDecoration(
              color: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 22),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 42,
                        child: Image.network(
                          this.widget.info.imageLink,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        this.widget.info.name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ],
                  ),
                  Divider(
                    color: Theme.of(context).focusColor,
                  ),
                  InfoParams(
                    info: this.widget.info,
                  ),
                  Divider(
                    color: Theme.of(context).focusColor,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.28,
                    child: SingleChildScrollView(
                      child: Text(
                        this.widget.info.description,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                  ),
                  Divider(
                    color: Theme.of(context).focusColor,
                    indent: 12,
                    endIndent: 12,
                  ),
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: TextButton(
                      child: Text('close'),
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InfoParams extends StatefulWidget {
  final MarketInfo info;

  InfoParams({
    required this.info,
  });

  @override
  State<InfoParams> createState() => _InfoParamsState();
}

class _InfoParamsState extends State<InfoParams> {
  late int marketBalance = 0;
  late int mainBalance = 0;
  void loadBalances() async {
    this.mainBalance = await Storage.loadMainBalance();
    this.marketBalance = await Storage.loadMarketBalance(
      this.widget.info.adress,
    );
    setState(() {});
  }

  @override
  void initState() {
    loadBalances();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Operation count: ' + widget.info.operationCount.toString(),
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            'Active buys: ' + widget.info.getAllBuys().length.toString(),
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            'Active sells: ' + widget.info.getAllSells().length.toString(),
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
            'Input fee: ' + widget.info.inputFee.toString() + '%',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            'Output fee: ' + widget.info.outputFee.toString() + '%',
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text(
            'Working time: ' + widget.info.workTime,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
