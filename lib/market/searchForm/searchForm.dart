import 'package:flutter/material.dart';

import 'package:sync_tree_mobile/_reusable/colors.dart';
import 'package:sync_tree_mobile/_reusable/dialogueTab.dart';

import 'settingsDialogue/settingsDialogue.dart';

class SearchForm extends StatelessWidget {
  final TextEditingController textController;
  final Function(String) onItemChanged;
  SearchForm({
    TextEditingController this.textController,
    Function(String) this.onItemChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Stack(
        children: [
          TextField(
            controller: textController,
            onTap: () => textController.selection = TextSelection(
              baseOffset: 0,
              extentOffset: textController.value.text.length,
            ),
            style: TextStyle(
              color: palette.textColor,
            ),
            onChanged: onItemChanged,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: palette.smallItemsColor),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: palette.smallItemsColor),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: palette.smallItemsColor),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.search_sharp,
                      color: palette.smallItemsColor,
                    ),
                    onPressed: () {},
                  ),
                  SizedBox(
                    width: 42,
                  )
                ],
              ),
              hintText: 'Enter asset name',
              labelText: 'Search',
              hintStyle: TextStyle(
                color: palette.textColor,
              ),
              labelStyle: TextStyle(
                color: palette.textColor,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 53,
              height: 58,
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(
                    Icons.settings_outlined,
                    color: palette.smallItemsColor,
                  ),
                  onPressed: () async {
                    await Dialogue.showDialogFuncition(
                      context,
                      SettingsDialogue(),
                      EdgeInsets.all(18),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
