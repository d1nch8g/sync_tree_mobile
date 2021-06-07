import 'package:flutter/material.dart';

class MarketButtonImage extends StatelessWidget {
  final String assetName;
  MarketButtonImage({this.assetName});
  @override
  Widget build(BuildContext context) {
    final String assetImage = 'assets/' + assetName + '.png';
    return Image.asset(
      assetImage,
      width: 26,
      height: 26,
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          'assets/coin.png',
          width: 26,
          height: 26,
        );
      },
    );
  }
}
