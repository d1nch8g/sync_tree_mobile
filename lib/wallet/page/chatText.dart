import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/local/crypto.dart';
import 'package:sync_tree_mobile_ui/src/net/user_calls.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ChatTextField extends StatelessWidget {
  final String marketAdress;
  final Uint8List marketMesKey;
  final TextEditingController controller = TextEditingController();
  ChatTextField({
    required this.marketMesKey,
    required this.marketAdress,
  });

  void showNotDeliveredSnackBar(context) {
    showTopSnackBar(
      context,
      CustomSnackBar.error(
        message: 'Unable to send message!',
        textStyle: Theme.of(context).textTheme.headline2!,
        icon: const Icon(
          Icons.message_rounded,
          color: const Color(0x15000000),
          size: 120,
        ),
        iconRotationAngle: 8,
      ),
    );
  }

  void sendMessage(context, String message) async {
    //try {
    var key = PublicKey.fromBytes(bytes: marketMesKey);
    var encryptedMessage = await key.encrypt(message);
    var delivered = await UserCalls.message(marketAdress, encryptedMessage);
    if (!delivered) {
      showNotDeliveredSnackBar(context);
    }
    // } catch (e) {
    //   print(e);
    //   showNotDeliveredSnackBar(context);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: Theme.of(context).focusColor,
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
          labelText: 'message to market',
          hoverColor: Theme.of(context).focusColor,
          fillColor: Theme.of(context).focusColor,
          focusColor: Theme.of(context).focusColor,
          suffixIcon: IconButton(
            icon: Icon(Icons.send),
            color: Theme.of(context).focusColor,
            onPressed: () {
              sendMessage(context, controller.text);
              FocusScope.of(context).unfocus();
            },
          ),
        ),
        onEditingComplete: () {
          sendMessage(context, controller.text);
        },
      ),
    );
  }
}
