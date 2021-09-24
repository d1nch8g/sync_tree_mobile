import 'package:flutter/material.dart';

class NoSearchResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.search_off_rounded,
            size: MediaQuery.of(context).size.width * 0.32,
          ),
          SizedBox(
            height: 18,
          ),
          Text(
            'No markets found.',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}

class ConnectionError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.search_off_rounded,
            size: MediaQuery.of(context).size.width * 0.32,
          ),
          SizedBox(
            height: 18,
          ),
          Text(
            'Connection error.',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
