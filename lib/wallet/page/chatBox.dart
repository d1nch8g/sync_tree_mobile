import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_10.dart';
import 'package:sync_tree_mobile_ui/src/local/storage.dart';

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
    if (mounted) {
      setState(() {});
    }
  }

  uploadMessages() async {
    
  }

  @override
  void initState() {
    super.initState();
    updateMessages();
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
          return Text('yo');
        },
      ),
    );
  }
}
