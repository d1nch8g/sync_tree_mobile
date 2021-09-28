import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_10.dart';
import 'package:sync_tree_mobile_ui/src/local/storage.dart';
import 'package:sync_tree_mobile_ui/src/net/info_calls.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ChatMessages extends StatefulWidget {
  final String adress;
  ChatMessages({required this.adress});
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
        padding: EdgeInsets.all(0),
        itemCount: messages.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
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
                  'Do not send your private key to anyone!\n'
                  'Check market ratio, operation count and adress before'
                  ' start of any transaction processing.',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          }
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
                messages[index - 1],
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
