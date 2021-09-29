import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_10.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_4.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_5.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_6.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_7.dart';
import 'package:sync_tree_mobile_ui/src/local/balance.dart';
import 'package:sync_tree_mobile_ui/src/local/storage.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ChatMessages extends StatefulWidget {
  final String adress;
  final int delimiter;
  ChatMessages({
    required this.adress,
    required this.delimiter,
  });
  @override
  State<ChatMessages> createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  List<String> messages = [];

  updateMessages() async {
    messages = await Storage.loadMessages(widget.adress);
    var keys = await Storage.loadKeys();
    try {
      var loadedMessages = await InfoCalls.messages(widget.adress);
      for (var i = messages.length; i < loadedMessages.length; i++) {
        var mes = loadedMessages[i].substring(0);
        var decrypted = await keys.message.private.decrypt(mes);
        Storage.addMessage(message: decrypted, adress: widget.adress);
        messages.add(decrypted);
      }
    } catch (e) {
      showTopSnackBar(
        context,
        CustomSnackBar.error(
          message: 'Unable to load new messages!',
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
    if (mounted) {
      messages = List.from(messages.reversed);
      if (messages.length == 0) {
        messages.add(
          'Do not send your private key to anyone!\n'
          'Check market ratio, operation count and adress before'
          ' start of any transaction processing.',
        );
      }
      setState(() {});
    }
  }

  startUpdating() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      if (mounted) {
        print('updaing');
        updateMessages();
      } else {
        t.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    updateMessages();
    startUpdating();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        reverse: true,
        padding: EdgeInsets.all(2),
        itemCount: messages.length,
        itemBuilder: (context, index) {
          var mes = messages[index];
          if (mes.startsWith('DR')) {
            return ChatBubble(
              clipper: ChatBubbleClipper4(
                type: BubbleType.sendBubble,
              ),
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 20),
              backGroundColor: Color(0xff00E676),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Text(
                  'Deposit request: ' +
                      Balance.tooString(
                        balance: int.parse(messages[index].substring(2)),
                        delimiter: widget.delimiter,
                      ),
                  style: TextStyle(color: Theme.of(context).cardColor),
                ),
              ),
            );
          }
          if (mes.startsWith('WR')) {
            return ChatBubble(
              clipper: ChatBubbleClipper4(
                type: BubbleType.sendBubble,
              ),
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 20),
              backGroundColor: Theme.of(context).hintColor,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Text(
                  'Withdrawal request: ' +
                      Balance.tooString(
                        balance: int.parse(messages[index].substring(2)),
                        delimiter: widget.delimiter,
                      ),
                  style: TextStyle(color: Theme.of(context).cardColor),
                ),
              ),
            );
          }
          if (mes.startsWith('uu')) {
            return ChatBubble(
              clipper: ChatBubbleClipper10(
                type: BubbleType.sendBubble,
              ),
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 20),
              backGroundColor: Theme.of(context).hoverColor,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Text(
                  messages[index].substring(2),
                  style: TextStyle(color: Theme.of(context).focusColor),
                ),
              ),
            );
          } else {
            return ChatBubble(
              clipper: ChatBubbleClipper10(
                type: BubbleType.receiverBubble,
              ),
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: 20),
              backGroundColor: Theme.of(context).cardColor,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Text(
                  messages[index],
                  style: TextStyle(color: Theme.of(context).focusColor),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
