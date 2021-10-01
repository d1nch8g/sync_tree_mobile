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
          size: MediaQuery.of(context).size.height * 0.125,
          color: Theme.of(context).hintColor,
        ),
        SizedBox(width: 8),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Market search',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'Found: 8',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'Connected: 2',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'Owned: 1',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.help_rounded,
          ),
        ),
      ],
    );
  }
}
