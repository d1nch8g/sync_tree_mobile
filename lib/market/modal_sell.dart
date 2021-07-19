import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:sync_tree_mobile/api/infoMarket.dart';
import 'package:sync_tree_mobile/api/infoUser.dart';
import 'package:sync_tree_mobile/api/sell.dart';

class SellButton extends StatelessWidget {
  final Market market;
  SellButton(this.market);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => SellOverlay(market),
        );
      },
      child: Text('sell'),
    );
  }
}

class SellOverlay extends StatefulWidget {
  final Market market;
  SellOverlay(this.market);

  @override
  State<StatefulWidget> createState() => SellOverlayState();
}

class SellOverlayState extends State<SellOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Widget currentContent;
  final TextEditingController offerController = TextEditingController();
  final TextEditingController recieveController = TextEditingController();

  void placeOrder() async {
    var response = await userSell(
      this.widget.market.adress,
      Int64.parseInt(offerController.text),
      Int64.parseInt(recieveController.text),
    );
    if (response) {
      setState(() {
        currentContent = Icon(
          Icons.check_circle_outline_rounded,
          size: MediaQuery.of(context).size.width * 0.32,
          color: Theme.of(context).focusColor,
        );
      });
      Future.delayed(Duration(milliseconds: 233), () {
        Navigator.pop(context);
      });
      updateSelfInformation();
    } else {
      setState(() {
        currentContent = Icon(
          Icons.do_disturb,
          size: MediaQuery.of(context).size.width * 0.32,
          color: Theme.of(context).focusColor,
        );
      });
      Future.delayed(Duration(milliseconds: 610), () {
        setState(() {
          currentContent = OfferRecieveConfirmContent(
            offerController,
            recieveController,
            this.widget.market,
            () {
              placeOrder();
            },
          );
        });
      });
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
    currentContent = OfferRecieveConfirmContent(
      offerController,
      recieveController,
      this.widget.market,
      () {
        placeOrder();
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
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: ShapeDecoration(
              color: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(32, 32, 32, 18),
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 144),
                child: currentContent,
                transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                ) =>
                    ScaleTransition(
                  scale: animation,
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OfferRecieveConfirmContent extends StatelessWidget {
  final TextEditingController offerController;
  final TextEditingController recieveController;
  final Market market;
  final Function placeOrder;

  OfferRecieveConfirmContent(
    this.offerController,
    this.recieveController,
    this.market,
    this.placeOrder,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AmountTextField(
            offerController,
            'Sell offer: `${this.market.name}`',
          ),
          SizedBox(height: 14),
          AmountTextField(
            recieveController,
            'Recieve: `SyncTree`',
          ),
          SizedBox(height: 14),
          Center(
            child: TextButton(
              onPressed: () {
                placeOrder();
              },
              child: Text('place order'),
            ),
          ),
        ],
      ),
    );
  }
}

class AmountTextField extends StatefulWidget {
  final TextEditingController controller;
  final String text;

  AmountTextField(
    this.controller,
    this.text,
  );
  @override
  _AmountTextFieldState createState() => _AmountTextFieldState();
}

class _AmountTextFieldState extends State<AmountTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.widget.controller,
      keyboardType: TextInputType.number,
      style: TextStyle(
        color: Theme.of(context).focusColor,
      ),
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
        hoverColor: Theme.of(context).focusColor,
        fillColor: Theme.of(context).focusColor,
        focusColor: Theme.of(context).focusColor,
        labelText: this.widget.text,
      ),
      cursorColor: Theme.of(context).focusColor,
    );
  }
}
