import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/local/balance.dart';
import 'package:sync_tree_mobile_ui/src/local/storage.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';
import 'dart:typed_data';

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
    if (message == '') {
      return;
    }
    var delivered = await UserCalls.message(
      marketAdress: marketAdress,
      marketMesKey: marketMesKey,
      message: message,
    );
    if (delivered) {
      Storage.addMessage(
        message: 'uu' + message,
        adress: marketAdress,
      );
      return;
    }
    showNotDeliveredSnackBar(context);
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
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }
}

class ChatMessages extends StatefulWidget {
  final String adress;
  final int delimiter;
  final List<String> messages;
  ChatMessages({
    required this.adress,
    required this.delimiter,
    required this.messages,
  });
  @override
  State<ChatMessages> createState() => _ChatMessagesState();
}

Future<List<String>> getMessages(String adress) async {
  var keys = await Storage.loadKeys();
  var curMessages = await Storage.loadMessages(adress);
  try {
    var loadedMessages = await InfoCalls.messages(adress);
    if (loadedMessages.length > curMessages.length) {
      for (var i = curMessages.length; i < loadedMessages.length; i++) {
        var mes = loadedMessages[i].substring(0);
        var decrypted = await keys.message.private.decrypt(mes);
        Storage.addMessage(message: decrypted, adress: adress);
        curMessages.add(decrypted);
      }
    }
  } catch (e) {}
  return List.from(curMessages.reversed);
}

class _ChatMessagesState extends State<ChatMessages> {
  late List<String> messages = [];
  Key key = UniqueKey();
  String firstMessage = 'This is market page. Here you can process deposit'
      ' and withdrawal operations. Before start of any transaction processing '
      'check market ratio and operation count. The decision to trust is on '
      'your own risk!';

  startChatUpdating() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      print('chat messages updating');
      var newMessages = await getMessages(widget.adress);
      if (!mounted) {
        timer.cancel();
        return;
      }
      if (newMessages.length == 0) {
        return;
      }
      if (newMessages[0] != messages[0] ||
          newMessages.length != messages.length) {
        key = UniqueKey();
        messages = newMessages;
        setState(() {});
      }
    });
  }

  @override
  void initState() {
    messages = widget.messages;
    if (messages.isEmpty) {
      messages.add(firstMessage);
      super.initState();
      startChatUpdating();
      return;
    }
    super.initState();
    startChatUpdating();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 610),
        child: ListView.builder(
          key: key,
          reverse: true,
          padding: EdgeInsets.all(2),
          itemCount: messages.length,
          itemBuilder: (context, index) {
            var mes = messages[index];
            if (mes.startsWith('DR')) {
              return CustomBubble(
                text: 'Deposit request: ' +
                    Balance.fromInt(
                      balance: int.parse(messages[index].substring(2)),
                      delimiter: widget.delimiter,
                    ),
                style: Theme.of(context).textTheme.headline5!,
                color: Color(0xff00E676),
                rightSide: true,
              );
            }
            if (mes.startsWith('WR')) {
              return CustomBubble(
                text: 'Withdrawal request: ' +
                    Balance.fromInt(
                      balance: int.parse(messages[index].substring(2)),
                      delimiter: widget.delimiter,
                    ),
                color: Theme.of(context).hintColor,
                rightSide: true,
                style: Theme.of(context).textTheme.headline5!,
              );
            }
            if (mes.startsWith('uu')) {
              return CustomBubble(
                text: messages[index].substring(2),
                color: Theme.of(context).primaryColorDark,
                rightSide: true,
                style: Theme.of(context).textTheme.bodyText1!,
              );
            } else {
              return CustomBubble(
                text: messages[index],
                color: Theme.of(context).primaryColorDark,
                rightSide: false,
                style: Theme.of(context).textTheme.bodyText1!,
              );
            }
          },
        ),
      ),
    );
  }
}

class CustomBubble extends StatelessWidget {
  final String text;
  final Color color;
  final bool rightSide;
  final TextStyle style;
  CustomBubble({
    required this.text,
    required this.color,
    required this.rightSide,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    if (rightSide) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Align(
          alignment: Alignment.topRight,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    style: style,
                  ),
                ),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: style,
                ),
              ),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
