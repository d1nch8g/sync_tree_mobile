import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/local/balance.dart';
import 'package:sync_tree_mobile_ui/src/local/storage.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';
import 'package:sync_tree_mobile_ui/src/net/user_calls.dart';
import 'package:sync_tree_mobile_ui/wallet/page/frame.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class DepositButton extends StatelessWidget {
  final MarketInfo info;
  DepositButton({required this.info});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        resizekb = false;
        showDialog(
          context: context,
          builder: (_) => GetAdressOverlay(
            info: info,
          ),
        ).whenComplete(() {
          resizekb = true;
        });
      },
      child: Text('deposit'),
    );
  }
}

class GetAdressOverlay extends StatefulWidget {
  final MarketInfo info;
  GetAdressOverlay({required this.info});
  @override
  State<StatefulWidget> createState() => GetAdressOverlayState();
}

class GetAdressOverlayState extends State<GetAdressOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation<double> scaleAnimation;
  final TextEditingController controller = TextEditingController();

  void deposit(context) async {
    if (controller.text == '') {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: 'No input sum!',
          textStyle: Theme.of(context).textTheme.headline2!,
        ),
      );
    }
    var bal = Balance.fromString(
      balance: controller.text,
      delimiter: widget.info.delimiter,
    );
    var mes = 'DR$bal';
    var delivered = await UserCalls.message(
      marketAdress: widget.info.adress,
      marketMesKey: Uint8List.fromList(widget.info.messageKey),
      message: mes,
    );
    if (delivered) {
      Storage.addMessage(
        message: 'DR$bal',
        adress: widget.info.adress,
      );
      showTopSnackBar(
        context,
        CustomSnackBar.success(
          message: 'Deposit request delivered!',
          textStyle: Theme.of(context).textTheme.headline2!,
        ),
      );
      Navigator.pop(context);
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 377),
    );
    scaleAnimation = CurvedAnimation(
      parent: animController,
      curve: Curves.decelerate,
    );
    animController.addListener(() {
      setState(() {});
    });
    animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.82,
            decoration: ShapeDecoration(
              color: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 22, 22, 22),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'DEPOSIT',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Divider(color: Theme.of(context).focusColor),
                  Text(
                    'Enter amount.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(height: 18),
                  TextField(
                    controller: controller,
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    style: TextStyle(
                      color: Theme.of(context).focusColor,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(
                          color: Theme.of(context).focusColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(
                          color: Theme.of(context).focusColor,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(
                          color: Theme.of(context).focusColor,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: Theme.of(context).focusColor,
                      ),
                      hoverColor: Theme.of(context).focusColor,
                      fillColor: Theme.of(context).focusColor,
                      focusColor: Theme.of(context).focusColor,
                      suffixIcon: IconButton(
                        onPressed: () {
                          deposit(context);
                        },
                        icon: Icon(Icons.check_circle_rounded),
                        color: Theme.of(context).focusColor,
                      ),
                    ),
                    cursorColor: Theme.of(context).focusColor,
                  ),
                  SizedBox(height: 18),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('close'),
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
