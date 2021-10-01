import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_4.dart';
import 'package:sync_tree_mobile_ui/src/local/balance.dart';
import 'package:sync_tree_mobile_ui/src/local/storage.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';

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
  Key startKey = UniqueKey();
  Duration initialDuration = Duration(milliseconds: 0);
  String firstMessage = 'This is market page. Here you can process deposit'
      ' and withdrawal operations. Before start of any transaction processing '
      'check market ratio and operation count. The decision to trust is on '
      'your own risk!';

  updateMessages() async {
    var keys = await Storage.loadKeys();
    var loadedMessages = await InfoCalls.messages(widget.adress);
    var curMessages = await Storage.loadMessages(widget.adress);
    if (loadedMessages.length > curMessages.length) {
      for (var i = curMessages.length; i < loadedMessages.length; i++) {
        var mes = loadedMessages[i].substring(0);
        var decrypted = await keys.message.private.decrypt(mes);
        Storage.addMessage(message: decrypted, adress: widget.adress);
        curMessages.add(decrypted);
      }
    }
    if (mounted) {
      curMessages = List.from(curMessages.reversed);
      if (curMessages.length == 0) {
        curMessages.add(firstMessage);
      }
      if (curMessages.length != messages.length ||
          curMessages[0] != messages[0]) {
        messages = curMessages;
        setState(() {});
      }
    }
  }

  startUpdating() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      if (mounted) {
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
    Future.delayed(Duration(milliseconds: 610), () {
      initialDuration = Duration(milliseconds: 610);
      startUpdating();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedSwitcher(
        duration: initialDuration,
        child: ListView.builder(
          key: UniqueKey(),
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
                        Balance.fromInt(
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
                        Balance.fromInt(
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
                clipper: ChatBubbleClipper4(
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
                clipper: ChatBubbleClipper4(
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
      ),
    );
  }
}
