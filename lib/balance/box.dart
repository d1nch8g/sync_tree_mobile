import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animations/animations.dart';

import '../_net/infoMarket.dart';
import '../_net/infoUser.dart';
import '../balance/page.dart';
import '../stream.dart';

class BalanceBox extends StatefulWidget {
  final Market market;
  BalanceBox(this.market);

  @override
  _BalanceBoxState createState() => _BalanceBoxState();
}

class _BalanceBoxState extends State<BalanceBox> {
  late String curBalance = '';
  late Widget imageWidget;
  int imgAnimationDuration = 610;

  void updateBalance() async {
    var prefs = await SharedPreferences.getInstance();
    var balance = prefs.getInt(base64.encode(this.widget.market.adress)) ?? 0;
    if (this.mounted) {
      setState(() {
        curBalance = balance.toString();
      });
    }
  }

  void startListeningBalanceChanging() {
    mainStream.listen((event) {
      if (event == base64.encode(this.widget.market.adress)) {
        updateBalance();
      }
    });
  }

  void hideImage() {
    imgAnimationDuration = 144;
    setState(() {
      imageWidget = Container(
        width: 0,
        height: 0,
      );
    });
  }

  void showImage() {
    imgAnimationDuration = 377;
    Future.delayed(Duration(milliseconds: 377), () {
      setState(() {
        imageWidget = UnfoldedImage(this.widget.market.img);
      });
    });
  }

  @override
  void initState() {
    imageWidget = UnfoldedImage(this.widget.market.img);
    super.initState();
    updateBalance();
    updateSelfInformation(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.36,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: OpenContainer(
              closedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              tappable: false,
              closedColor: Theme.of(context).hoverColor,
              openColor: Theme.of(context).hoverColor,
              transitionDuration: Duration(milliseconds: 610),
              closedBuilder: (context, openIt) {
                return InkWell(
                  onTap: () {
                    openIt();
                    hideImage();
                  },
                  child: Container(
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
                );
              },
              openBuilder: (context, goBack) => BalanceConnectPage(() {
                showImage();
                goBack();
              }),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: imgAnimationDuration),
              child: imageWidget,
              transitionBuilder: (
                Widget child,
                Animation<double> animation,
              ) =>
                  ScaleTransition(
                scale: animation,
                child: child,
              ),
              switchOutCurve: Curves.easeInCirc,
              switchInCurve: Curves.easeIn,
            ),
          ),
        ],
      ),
    );
  }
}

class UnfoldedImage extends StatelessWidget {
  final String img;
  UnfoldedImage(this.img);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).focusColor,
        shape: BoxShape.circle,
      ),
      width: MediaQuery.of(context).size.width * 0.28,
      child: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.22,
          child: Image.network(img),
        ),
      ),
    );
  }
}
