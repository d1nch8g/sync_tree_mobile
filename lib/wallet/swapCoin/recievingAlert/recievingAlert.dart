import 'package:flutter/material.dart';
import 'package:sync_tree_mobile/_reusable/colors.dart';
import 'package:clipboard/clipboard.dart';
import 'package:sync_tree_mobile/_reusable/dialogueTab.dart';

class RecievingDialogueBox extends StatelessWidget {
  final String ownerPublicKey = '1231asdkjhaklajfhd8u1238687ysadfkasudhf';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.86,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Recieve SWP',
              style: TextStyle(
                fontSize: 23,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
              child: Text(
                '''   Give this adress to sender                            ''',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                overflow: TextOverflow.clip,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: TextEditingController(
                //TODO replace with generated public key
                text: ownerPublicKey,
              ),
              readOnly: true,
              style: TextStyle(
                color: palette.textColor,
              ),
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
                labelText: 'Your public adress',
                hintStyle: TextStyle(
                  color: palette.textColor,
                ),
                hintText: 'Enter adress to send',
                labelStyle: TextStyle(
                  color: palette.textColor,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.copy,
                    color: palette.smallItemsColor,
                  ),
                  onPressed: () {
                    FlutterClipboard.controlC(ownerPublicKey);
                  },
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(2),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(DialogueAction.abort);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.not_interested_rounded,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'close',
                        style: TextStyle(
                          color: palette.textColor,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(12, 2, 12, 2),
                    primary: palette.textColor,
                    backgroundColor: palette.appBarColor,
                    side: BorderSide(
                      width: 1.6,
                      color: palette.buttonBorderColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
        ],
      ),
    );
  }
}
