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
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          color: Theme.of(context).focusColor,
        ),
        onEditingComplete: () async {
          updateMarketList();
          FocusScope.of(context).unfocus();
        },
        onChanged: (x) async {
          Storage.saveSearchCache(x);
        },
        focusNode: focuser,
        cursorColor: Theme.of(context).focusColor,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Theme.of(context).focusColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Theme.of(context).focusColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: Theme.of(context).focusColor),
          ),
          labelStyle: TextStyle(
            color: Theme.of(context).focusColor,
          ),
          labelText: 'type market name',
          hoverColor: Theme.of(context).focusColor,
          fillColor: Theme.of(context).focusColor,
          focusColor: Theme.of(context).focusColor,
          suffixIcon: IconButton(
            icon: Icon(Icons.search_rounded),
            color: Theme.of(context).focusColor,
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
