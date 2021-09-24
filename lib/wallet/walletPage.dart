import 'package:flutter/material.dart';

class ConnectedWalletPage extends StatelessWidget {
  final Function closeContainer;
  ConnectedWalletPage({required this.closeContainer});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).hoverColor,
      body: Center(
        child: TextButton(
          child: Text('close'),
          onPressed: () {
            closeContainer();
          },
        ),
      ),
    );
  }
}

class ChatMessages extends StatefulWidget {
  @override
  _ChatMessagesState createState() => _ChatMessagesState();
}

class _ChatMessagesState extends State<ChatMessages> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ChatTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BottomInfoPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class WithdrawalDepositButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
