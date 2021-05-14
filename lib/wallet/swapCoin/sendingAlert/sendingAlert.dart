import 'package:flutter/material.dart';
import 'package:wallet_app/_reusable/colors.dart';
import 'package:clipboard/clipboard.dart';
import 'package:wallet_app/_reusable/dialogueTab.dart';
class SendingDialogueBox extends StatelessWidget {
  final TextEditingController controller = TextEditingController();
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
              'Send SWP',
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
                '''   Type in an adress which you want to send SwapCoin, you can take it from reciever''',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                overflow: TextOverflow.clip,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: controller,
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
                labelText: 'Sending adress',
                hintStyle: TextStyle(
                  color: palette.textColor,
                ),
                hintText: 'Enter adress to send',
                labelStyle: TextStyle(
                  color: palette.textColor,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.paste,
                    color: palette.smallItemsColor,
                  ),
                  onPressed: () async {
                    final String sendKey = await FlutterClipboard.paste();
                    controller.text = sendKey;
                    //TODO реализовать отправку сообщений
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
                        'cancel',
                        style: TextStyle(
                          color: palette.textColor,
                          fontSize: 20,
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
              Padding(
                padding: const EdgeInsets.all(2),
                child: TextButton(
                  onPressed: () {
                    //TODO напихать сюда логику для отправки по адресу
                    Navigator.of(context).pop(DialogueAction.abort);
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.send_sharp,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        ' send ',
                        style: TextStyle(
                          color: palette.textColor,
                          fontSize: 20,
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
