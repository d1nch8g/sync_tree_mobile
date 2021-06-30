import 'package:flutter/material.dart';

class BottomStuff extends StatefulWidget {
  @override
  _BottomStuffState createState() => _BottomStuffState();
}

class _BottomStuffState extends State<BottomStuff> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20.0),
          topRight: const Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 5,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(2.5),
                color: Theme.of(context).focusColor,
              ),
            ),
          ),
          SizedBox(
            height: 320,
            child: Text('insert prices widget'),
          ),
          ListTile(
            title: Image.network('inser net image source'),
            leading: Text('insert name text'),
            trailing: Text('insert operation count'),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('insert description text'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
