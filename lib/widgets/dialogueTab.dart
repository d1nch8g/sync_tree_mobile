import 'package:flutter/material.dart';

/*
CALL EXAMPLE:
onPressed: () async {
  await Dialogue.showDialogFuncition(...);
},
ADD THIS TO SOME BUTTON IN DIALOGUE WIDGET:
Navigator.of(context).pop(DialogueAction.abort);
*/

enum DialogueAction { start, abort }

class Dialogue {
  static Future<DialogueAction> showDialogFuncition(
    BuildContext context,
    Widget dialogueWidget,
    EdgeInsets dialogPadding,
  ) async {
    final action = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding: dialogPadding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade700,
                width: 1.2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: dialogueWidget,
          ),
        );
      },
    );
    return (action != null) ? action : DialogueAction.abort;
  }
}
