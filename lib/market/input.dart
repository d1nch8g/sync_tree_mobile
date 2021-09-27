import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/src/local/storage.dart';

class MarketTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focuser;
  final Function updateMarketList;
  MarketTextField({
    required this.controller,
    required this.focuser,
    required this.updateMarketList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: TextField(
        controller: controller,
        onEditingComplete: () async {
          updateMarketList();
          FocusScope.of(context).unfocus();
        },
        onChanged: (x) async {
          Storage.saveSearchCache(x);
        },
        focusNode: focuser,
        style: TextStyle(
          color: Theme.of(context).backgroundColor,
        ),
        cursorColor: Theme.of(context).backgroundColor,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Theme.of(context).backgroundColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Theme.of(context).backgroundColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Theme.of(context).backgroundColor),
          ),
          labelStyle: TextStyle(
            color: Theme.of(context).backgroundColor,
          ),
          labelText: 'type market name',
          hoverColor: Theme.of(context).backgroundColor,
          fillColor: Theme.of(context).backgroundColor,
          focusColor: Theme.of(context).backgroundColor,
          suffixIcon: IconButton(
            icon: Icon(Icons.search_rounded),
            color: Theme.of(context).backgroundColor,
            onPressed: () {
              updateMarketList();
              FocusScope.of(context).unfocus();
            },
          ),
        ),
      ),
    );
  }
}
