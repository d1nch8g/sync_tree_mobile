import 'package:flutter/material.dart';

class SearchLogo extends StatefulWidget {
  @override
  _SearchLogoState createState() => _SearchLogoState();
}

class _SearchLogoState extends State<SearchLogo> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.stacked_line_chart_rounded,
          size: MediaQuery.of(context).size.height * 0.15,
          color: Theme.of(context).hintColor,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Search module',
              style: Theme.of(context).textTheme.headline4,
            ),
            
          ],
        ),
      ],
    );
  }
}
