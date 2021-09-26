import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:sync_tree_mobile_ui/market/page/sell.dart';
import '../../navigator.dart';
import '../../src/src.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class BuyButton extends StatelessWidget {
  final MarketInfo info;
  BuyButton({required this.info});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => BuyOverlay(
            info: info,
          ),
        );
      },
      child: Text('buy'),
    );
  }
}

class BuyOverlay extends StatefulWidget {
  final MarketInfo info;
  BuyOverlay({
    required this.info,
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
  late Widget switchingBottomButtons;
  void placeOrder() async {
    try {
      var operated = await UserCalls.buy(
        widget.info.adress,
        int.parse(recieveController.text),
        int.parse(offerController.text),
      );
      if (operated) {
        showTopSnackBar(
          context,
          CustomSnackBar.success(
            message: 'Buy order placed!',
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
    var mainBalance = await Storage.loadMainBalance();
    if (offerController.text == '' ||
        int.parse(offerController.text) > mainBalance ||
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
      recieveWidget = InputTextField(
        controller: recieveController,
        message: 'Recieve (${widget.info.name})',
        node: recieveFocusNode,
        onTypeEnd: () {
          finishRecieveTyping();
        },
      );
      offerWidget = FinishedValueWidget(
        topText: 'Sync tree main',
        recieveValueText: 'Offer: ${offerController.text}',
      );
      this.offerFixed = true;
      setState(() {});
      ifAmountsFixedShowPlaceTradeButton();
    }
  }

  late Widget recieveWidget;
  final TextEditingController recieveController = TextEditingController();
  final FocusNode recieveFocusNode = FocusNode();
  void finishRecieveTyping() {
    if (recieveController.text == '' ||
        double.parse(recieveController.text) == 0) {
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
      message: 'Offer (Sync tree main)',
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
                      'BUY ORDER',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Divider(color: Theme.of(context).focusColor),
                    SizedBox(height: 6),
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
