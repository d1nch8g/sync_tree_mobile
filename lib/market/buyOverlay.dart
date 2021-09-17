import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:sync_tree_mobile_logic/net/info_calls.dart';

class BuyOverlay extends StatefulWidget {
  final MarketInfo info;
  final int mainBalance;
  BuyOverlay({
    required this.info,
    required this.mainBalance,
  });

  @override
  State<StatefulWidget> createState() => BuyOverlayState();
}

class BuyOverlayState extends State<BuyOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  bool offerFixed = false;
  bool recieveFixed = false;
  void showPlaceTradeButton() {
    if (offerFixed && recieveFixed) {
      
    }
  }

  late Widget offerWidget;
  final TextEditingController offerController = TextEditingController();
  final FocusNode offerFocusNode = FocusNode();
  void finishOfferTyping() async {
    if (offerController.text == '' ||
        int.parse(offerController.text) > widget.mainBalance ||
        int.parse(offerController.text) == 0) {
      offerWidget = Icon(
        Icons.cancel_rounded,
        color: Theme.of(context).focusColor,
        size: 42,
      );
      offerController.text = '';
      setState(() {});
      Future.delayed(Duration(milliseconds: 610), () {
        offerWidget = InputTextField(
          controller: offerController,
          message: 'Offer (Sync tree main)',
          node: offerFocusNode,
          onTypeEnd: () {
            finishOfferTyping();
          },
        );
        setState(() {});
      });
    } else {
      offerFocusNode.unfocus();
      offerWidget = FinishedValueWidget(
        topText: 'Sync tree main',
        recieveValueText: 'Offer: ${offerController.text}',
      );
    }
  }

  late Widget recieveWidget;
  final TextEditingController recieveController = TextEditingController();
  final FocusNode recieveFocusNode = FocusNode();
  void finishRecieveTyping() {
    if (recieveController.text == '' ||
        int.parse(recieveController.text) == 0) {
      recieveWidget = Icon(
        Icons.cancel_rounded,
        color: Theme.of(context).focusColor,
        size: 42,
      );
      recieveController.text = '';
      setState(() {});
      Future.delayed(Duration(milliseconds: 610), () {
        recieveWidget = InputTextField(
          controller: recieveController,
          message: 'Recieve (${widget.info.name})',
          node: recieveFocusNode,
          onTypeEnd: () {
            finishRecieveTyping();
          },
        );
        setState(() {});
      });
    } else {
      recieveFocusNode.unfocus();
      recieveWidget = FinishedValueWidget(
        topText: '${widget.info.name}',
        recieveValueText: 'Recieve: ${recieveController.text}',
      );
    }
  }

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
    offerWidget = InputTextField(
      controller: offerController,
      message: 'Offer (Sync tree main)',
      node: offerFocusNode,
      onTypeEnd: () {
        finishOfferTyping();
      },
    );
    recieveWidget = InputTextField(
      controller: recieveController,
      message: 'Recieve (${widget.info.name})',
      node: recieveFocusNode,
      onTypeEnd: () {
        finishRecieveTyping();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.88,
            decoration: ShapeDecoration(
              color: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 22, 24, 22),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'BUY',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    'To buy `${this.widget.info.name}` set the offer and recieve values.',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  SizedBox(height: 22),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 144),
                    child: offerWidget,
                  ),
                  SizedBox(height: 22),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 144),
                    child: recieveWidget,
                  ),
                  SizedBox(height: 22),
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

class InputTextField extends StatelessWidget {
  final TextEditingController controller;
  final String message;
  final FocusNode node;
  final Function onTypeEnd;
  InputTextField({
    required this.controller,
    required this.message,
    required this.node,
    required this.onTypeEnd,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: node,
      style: TextStyle(
        color: Theme.of(context).focusColor,
      ),
      keyboardType: TextInputType.numberWithOptions(),
      cursorColor: Theme.of(context).focusColor,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Theme.of(context).focusColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Theme.of(context).focusColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Theme.of(context).focusColor),
        ),
        labelStyle: TextStyle(
          color: Theme.of(context).focusColor,
        ),
        labelText: message,
        hoverColor: Theme.of(context).focusColor,
        fillColor: Theme.of(context).focusColor,
        focusColor: Theme.of(context).focusColor,
        suffixIcon: IconButton(
          icon: Icon(Icons.check_circle_rounded),
          color: Theme.of(context).focusColor,
          onPressed: () {
            onTypeEnd();
          },
        ),
      ),
    );
  }
}

class FinishedValueWidget extends StatelessWidget {
  final String topText;
  final String recieveValueText;
  FinishedValueWidget({
    required this.topText,
    required this.recieveValueText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(topText),
        Divider(color: Theme.of(context).focusColor),
        Text(recieveValueText),
      ],
    );
  }
}
