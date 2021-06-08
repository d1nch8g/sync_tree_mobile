import 'package:flutter/material.dart';
import 'colors.dart';

/*
CALL EXAMPLE
onPressed: () async {
  await ModalTab.showModalFunction(...);
},
ADD THIS TO SOME BUTTON IN MODAL PAGE:
Navigator.of(context).pop(ModalAction.abort);
*/

enum ModalAction { start, abort }

class ModalTab {
  static Future<ModalAction> showModalFunction(
    BuildContext context,
    Widget dialogueWidget,
    double screenTaken,
  ) async {
    final action = await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * screenTaken,
          decoration: new BoxDecoration(
            color: palette.appBarColor,
            borderRadius: new BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0),
            ),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: Container(
                    width: 112,
                    height: 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      color: Colors.grey[350],
                    ),
                  ),
                ),
              ),
              dialogueWidget,
            ],
          ),
        );
      },
    );
    return (action != null) ? action : ModalAction.abort;
  }
}
