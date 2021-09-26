import 'package:flutter/material.dart';

class CancelTradeWidget extends StatefulWidget {
  @override
  _CancelTradeWidgetState createState() => _CancelTradeWidgetState();
}

class _CancelTradeWidgetState extends State<CancelTradeWidget> {
  Widget button = Container();

  checkIfUserHasTrades() async {
    
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 377),
      child: button,
    );
  }
}
