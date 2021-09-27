import 'package:flutter/material.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return Text('yo');
        },
      ),
    );
  }
}
