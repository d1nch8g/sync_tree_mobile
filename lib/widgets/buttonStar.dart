import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

StreamController<String> likeStreamController = StreamController<String>();
Stream likeStream = likeStreamController.stream.asBroadcastStream();

class MarketButtonStar extends StatefulWidget {
  final String assetName;
  final Key key;

  MarketButtonStar({
    this.assetName,
    this.key,
  });
  @override
  _MarketButtonStarState createState() => _MarketButtonStarState(
        assetName: assetName,
      );
}

class _MarketButtonStarState extends State<MarketButtonStar> {
  final String assetName;
  _MarketButtonStarState({this.assetName});

  Color starColor = Colors.white;

  Future<void> switchLikeInPreferences() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(assetName + '_liked') == true) {
      prefs.setBool(assetName + '_liked', false);
    } else {
      prefs.setBool(assetName + '_liked', true);
    }
  }

  Future<void> setCurrentColor() async {
    var prefs = await SharedPreferences.getInstance();
    setState(() {
      if (prefs.getBool(assetName + '_liked') == true) {
        starColor = Colors.yellow;
      } else {
        starColor = Colors.white;
      }
    });
  }

  checkLike(String like) {
    String streamAssetName = like.split('|')[0];
    String streamLikeState = like.split('|')[1];
    if (streamAssetName == assetName) {
      Color currentTrueAssetColor;
      if (streamLikeState == 'true') {
        currentTrueAssetColor = Colors.yellow;
      } else {
        currentTrueAssetColor = Colors.white;
      }
      if (starColor != currentTrueAssetColor) {
        setState(() {
          starColor = currentTrueAssetColor;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    setCurrentColor();
    likeStream.listen((like) {
      checkLike(like);
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 26,
      icon: Icon(
        Icons.star,
        color: starColor,
      ),
      onPressed: () {
        setState(() {
          if (starColor == Colors.white) {
            starColor = Colors.yellow;
            likeStreamController.add(assetName + '|true');
          } else {
            starColor = Colors.white;
            likeStreamController.add(assetName + '|false');
          }
        });
        switchLikeInPreferences();
      },
    );
  }
}
