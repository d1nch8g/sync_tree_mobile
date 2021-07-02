import 'package:flutter/material.dart';
import 'package:sync_tree_mobile/market/search.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({Key? key}) : super(key: key);

  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  late Widget searchWidget;

  void switchToSearch() {
    setState(() {
      searchWidget = SearchModule();
    });
  }

  @override
  void initState() {
    searchWidget = SearchPreview(() {
      switchToSearch();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Icon(
            Icons.stacked_line_chart_rounded,
            size: MediaQuery.of(context).size.height * 0.15,
            color: Theme.of(context).hintColor,
          ),
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 610),
              switchInCurve: Curves.easeInExpo,
              switchOutCurve: Curves.easeIn,
              child: searchWidget,
              transitionBuilder: (
                Widget child,
                Animation<double> animation,
              ) =>
                  ScaleTransition(
                scale: animation,
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchPreview extends StatelessWidget {
  final Function switchToSearch;
  SearchPreview(this.switchToSearch);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'search',
          style: Theme.of(context).textTheme.headline3,
        ),
        Divider(),
        Expanded(
          child: IconButton(
            onPressed: () {
              switchToSearch();
            },
            icon: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).hoverColor,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.search_rounded),
            ),
            color: Theme.of(context).focusColor,
            iconSize: MediaQuery.of(context).size.width * 0.32,
          ),
        ),
      ],
    );
  }
}
