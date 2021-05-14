import 'package:flutter/material.dart';
import 'dart:async';

import 'package:wallet_app/_reusable/colors.dart';
import 'package:wallet_app/_reusable/iconTextButton.dart';
import 'package:wallet_app/_reusable/dialogueTab.dart';

StreamController<Map> settingsController = StreamController<Map>();
Stream settingStream = settingsController.stream.asBroadcastStream();

class SettingsDialogue extends StatefulWidget {
  @override
  _SettingsDialogueState createState() => _SettingsDialogueState();
}

class _SettingsDialogueState extends State<SettingsDialogue> {
  bool favoritesSwitchState = false;
  bool rateSwitchState = false;
  String searchStringType = 'market value';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Search settings',
              style: TextStyle(
                color: palette.smallItemsColor,
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 48.0,
            width: 350.0,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: palette.buttonsColor,
              border: Border.all(
                color: palette.buttonBorderColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Text(
                  'Only favorites',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                ),
                Expanded(
                  child: Align(
                    child: Switch(
                      activeColor: Colors.white,
                      value: favoritesSwitchState,
                      onChanged: (value) {
                        setState(() {
                          if (favoritesSwitchState == false) {
                            favoritesSwitchState = true;
                          } else {
                            favoritesSwitchState = false;
                          }
                        });
                      },
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 48.0,
            width: 350.0,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: palette.buttonsColor,
              border: Border.all(
                color: palette.buttonBorderColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Text(
                  'Only high rate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  ),
                ),
                Expanded(
                  child: Align(
                    child: Switch(
                      activeColor: Colors.white,
                      value: rateSwitchState,
                      onChanged: (value) {
                        setState(() {
                          if (rateSwitchState == false) {
                            rateSwitchState = true;
                          } else {
                            rateSwitchState = false;
                          }
                        });
                      },
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            // height: 320.0,
            width: 350.0,
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: palette.buttonsColor,
              border: Border.all(
                color: palette.buttonBorderColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Sorting mode',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Divider(
                  height: 0,
                  color: Colors.grey,
                  thickness: 1,
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '  market value',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                      ),
                    ),
                    Radio(
                      activeColor: Colors.white,
                      value: 'market value',
                      groupValue: searchStringType,
                      onChanged: (value) {
                        setState(() {
                          searchStringType = value.toString();
                        });
                      },
                    ),
                  ],
                ),
                Divider(
                  height: 0,
                  color: Colors.grey.shade700,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '  low price',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                      ),
                    ),
                    Radio(
                      activeColor: Colors.white,
                      value: 'low price',
                      groupValue: searchStringType,
                      onChanged: (value) {
                        setState(() {
                          searchStringType = value.toString();
                        });
                      },
                    ),
                  ],
                ),
                Divider(
                  height: 0,
                  color: Colors.grey.shade700,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '  high price',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                      ),
                    ),
                    Radio(
                      activeColor: Colors.white,
                      value: 'high price',
                      groupValue: searchStringType,
                      onChanged: (value) {
                        setState(() {
                          searchStringType = value.toString();
                        });
                      },
                    ),
                  ],
                ),
                Divider(
                  height: 0,
                  color: Colors.grey.shade700,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '  withdrawal fee',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                      ),
                    ),
                    Radio(
                      activeColor: Colors.white,
                      value: 'withdrawal',
                      groupValue: searchStringType,
                      onChanged: (value) {
                        setState(() {
                          searchStringType = value.toString();
                        });
                      },
                    ),
                  ],
                ),
                Divider(
                  height: 0,
                  color: Colors.grey.shade700,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '  deposit fee',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                      ),
                    ),
                    Radio(
                      activeColor: Colors.white,
                      value: 'deposit',
                      groupValue: searchStringType,
                      onChanged: (value) {
                        setState(() {
                          searchStringType = value.toString();
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RbuttonIconText(
                text: 'cancel',
                icon: Icons.remove_circle_outline_outlined,
                onPressed: () {
                  Navigator.of(context).pop(DialogueAction.abort);
                },
                contentPadding: EdgeInsets.all(2),
                buttonColor: palette.buttonsColor,
                borderRadius: 12,
                borderWidth: 1.6,
                borderColor: palette.buttonEdgesColor,
              ),
              RbuttonIconText(
                text: 'accept',
                icon: Icons.check_circle_outline_outlined,
                onPressed: () {
                  Navigator.of(context).pop(DialogueAction.abort);
                  settingsController.add({
                    "onlyFavorites": favoritesSwitchState,
                    "onlyHighRate": rateSwitchState,
                    "sortMode": searchStringType
                  });
                },
                contentPadding: EdgeInsets.all(2),
                buttonColor: palette.buttonsColor,
                borderRadius: 12,
                borderWidth: 1.6,
                borderColor: palette.buttonEdgesColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
