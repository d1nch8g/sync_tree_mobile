import 'package:flutter/material.dart';
import 'package:sync_tree_mobile/api/userSearch.dart';

class MarketPage extends StatefulWidget {
  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  var sometext = '';

  var marketExampleList = [
    {
      MarketInfo.description: 'Example of some description',
      MarketInfo.imgLink:
          'https://image.flaticon.com/icons/png/512/1490/1490839.png',
      MarketInfo.mesKey: 'example of some message key',
      MarketInfo.name: 'Name example',
      MarketInfo.opCount: '89',
    },
    {
      MarketInfo.description: 'Example of some description num 2',
      MarketInfo.imgLink:
          'https://image.flaticon.com/icons/png/512/1490/1490849.png',
      MarketInfo.mesKey: 'example of some message key num 2',
      MarketInfo.name: 'Name example num 2',
      MarketInfo.opCount: '101',
    }
  ];

  void getMarkets() async {
    var rez = await userSearch("market");
    print(rez);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Theme.of(context).buttonColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Theme.of(context).buttonColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Theme.of(context).buttonColor),
                ),
                labelStyle: TextStyle(
                  color: Theme.of(context).buttonColor,
                ),
                labelText: 'market search',
                hoverColor: Theme.of(context).buttonColor,
                fillColor: Theme.of(context).buttonColor,
                focusColor: Theme.of(context).buttonColor,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: marketExampleList.length,
            itemBuilder: (context, idx) {
              return ListTile(
                title: Text(marketExampleList[idx][MarketInfo.name] ?? ''),
                subtitle:
                    Text(marketExampleList[idx][MarketInfo.description] ?? ''),
                leading: Image.network(
                    marketExampleList[idx][MarketInfo.imgLink] ?? ''),
                trailing:
                    Text(marketExampleList[idx][MarketInfo.opCount] ?? ''),
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
