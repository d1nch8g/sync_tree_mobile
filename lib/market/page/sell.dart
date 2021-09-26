import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:sync_tree_mobile_ui/src/local/balance.dart';
import '../../navigator.dart';
import '../../src/src.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SellButton extends StatelessWidget {
  final MarketInfo info;
  SellButton({required this.info});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => SellOverlay(
            info: info,
          ),
        );
      },
      child: Text('sell'),
    );
  }
}

class SellOverlay extends StatefulWidget {
  final MarketInfo info;
  SellOverlay({
    required this.info,
  });
  @override
  State<StatefulWidget> createState() => SellOverlayState();
}

class SellOverlayState extends State<SellOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  bool offerFixed = false;
  bool recieveFixed = false;
  late Widget switchingBottomButtons;
  void placeOrder() async {
    try {
      var operated = await UserCalls.sell(
        widget.info.adress,
        Balance.fromString(
          balance: recieveController.text,
          delimiter: 2,
        ),
        Balance.fromString(
          balance: offerController.text,
          delimiter: widget.info.delimiter,
        ),
      );
      if (operated) {
        showTopSnackBar(
          context,
          CustomSnackBar.success(
            message: 'Sell order placed!',
            backgroundColor: Theme.of(context).hoverColor,
            textStyle: Theme.of(context).textTheme.headline2!,
            icon: const Icon(
              Icons.playlist_add_check_rounded,
              color: const Color(0x15000000),
              size: 120,
            ),
            iconRotationAngle: 8,
          ),
        );
        Navigator.pop(context);
        Future.delayed(Duration(milliseconds: 377), () {
          updateSelfInformation();
        });
      } else {
        showTopSnackBar(
          context,
          CustomSnackBar.error(
            message: 'Order error!\nRemove active orders.',
            textStyle: Theme.of(context).textTheme.headline2!,
          ),
        );
      }
    } catch (e) {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: 'Order error!\nConnection failed.',
          textStyle: Theme.of(context).textTheme.headline2!,
        ),
      );
    }
  }

  void ifAmountsFixedShowPlaceTradeButton() {
    if (offerFixed && recieveFixed) {
      switchingBottomButtons = PlaceOrderCancelButtons(
        placeOrder: () {
          placeOrder();
        },
      );
    }
  }

  late Widget offerWidget;
  final TextEditingController offerController = TextEditingController();
  final FocusNode offerFocusNode = FocusNode();

  void finishOfferTyping() async {
    var marketBalance = await Storage.loadMarketBalance(widget.info.adress);
    var marketOffer = Balance.fromString(
      balance: offerController.text,
      delimiter: widget.info.delimiter,
    );
    if (offerController.text == '' ||
        marketOffer > marketBalance ||
        marketOffer == 0) {
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
          message: 'Offer ${widget.info.name}',
          node: offerFocusNode,
          onTypeEnd: () {
            finishOfferTyping();
          },
        );
        setState(() {});
      });
    } else {
      offerFocusNode.unfocus();
      recieveWidget = InputTextField(
        controller: recieveController,
        message: 'Sync Tree Main',
        node: recieveFocusNode,
        onTypeEnd: () {
          finishRecieveTyping();
        },
      );
      offerWidget = FinishedValueWidget(
        topText: '${this.widget.info.name}',
        recieveValueText: 'Offer: ${offerController.text}',
      );
      this.offerFixed = true;
      ifAmountsFixedShowPlaceTradeButton();
    }
  }

  late Widget recieveWidget;
  final TextEditingController recieveController = TextEditingController();
  final FocusNode recieveFocusNode = FocusNode();
  void finishRecieveTyping() {
    var mainRecieve = Balance.fromString(
      balance: recieveController.text,
      delimiter: 2,
    );
    if (recieveController.text == '' || mainRecieve == 0) {
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
          message: 'Recieve: Sync tree main',
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
        topText: 'Sync tree main',
        recieveValueText: 'Recieve: ${recieveController.text}',
      );
      this.recieveFixed = true;
      ifAmountsFixedShowPlaceTradeButton();
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
      message: 'Offer: ${widget.info.name}',
      node: offerFocusNode,
      onTypeEnd: () {
        finishOfferTyping();
      },
    );
    recieveWidget = Center();
    switchingBottomButtons = TextButton(
      child: Text('close'),
      onPressed: () async {
        Navigator.pop(context);
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
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 610),
                transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                ) =>
                    ScaleTransition(
                  scale: animation,
                  child: child,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'SELL ORDER',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Divider(color: Theme.of(context).focusColor),
                    SizedBox(height: 6),
                    Text(
                      'To sell `${this.widget.info.name}` set the offer and recieve values.',
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
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 144),
                        child: switchingBottomButtons,
                      ),
                    ),
                  ],
                ),
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
      keyboardType: TextInputType.numberWithOptions(
        decimal: true,
      ),
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

class PlaceOrderCancelButtons extends StatelessWidget {
  final Function placeOrder;
  PlaceOrderCancelButtons({required this.placeOrder});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          child: Text('cancel'),
          onPressed: () async {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Text('place order'),
          onPressed: () async {
            placeOrder();
          },
        ),
      ],
    );
  }
}

class BuySuccedOverlay extends StatefulWidget {
  final String succedMessage;
  BuySuccedOverlay({required this.succedMessage});
  @override
  State<StatefulWidget> createState() => SuccessOverlay();
}

class SuccessOverlay extends State<BuySuccedOverlay>
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
            width: MediaQuery.of(context).size.width * 0.72,
            decoration: ShapeDecoration(
              color: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(38, 38, 38, 22),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    this.widget.succedMessage,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Icon(
                    Icons.check_circle_outline_rounded,
                    size: 144,
                    color: Theme.of(context).focusColor,
                  ),
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: TextButton(
                      child: Text('close'),
                      onPressed: () async {
                        Navigator.pop(context);
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
