import 'package:flutter/material.dart';

class WalletChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).focusColor,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Column(
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(
                color: Theme.of(context).cardColor,
              ),
              cursorColor: Theme.of(context).cardColor,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Theme.of(context).cardColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Theme.of(context).cardColor),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  borderSide: BorderSide(color: Theme.of(context).cardColor),
                ),
                labelStyle: TextStyle(
                  color: Theme.of(context).cardColor,
                ),
                labelText: 'type market name',
                hoverColor: Theme.of(context).cardColor,
                fillColor: Theme.of(context).cardColor,
                focusColor: Theme.of(context).cardColor,
                suffixIcon: IconButton(
                  icon: Icon(Icons.search_rounded),
                  color: Theme.of(context).cardColor,
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
