import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../_local/crypt.dart';

class LocalWallets extends StatefulWidget {
  @override
  _LocalWalletsState createState() => _LocalWalletsState();
}

class _LocalWalletsState extends State<LocalWallets> {
  final List<String> foundConnections = [];
  late Widget searchWidget;

  @override
  void initState() {
    super.initState();
    searchWidget = LocalButton(() {
      startSearch();
    });
  }

  void stopSearch() {
    setState(() {
      searchWidget = LocalButton(() {
        startSearch();
      });
    });
  }

  void startSearch() async {
    setState(() {
      searchWidget = LocalSpinKit(() {
        stopSearch();
      });
    });
    var prefs = await SharedPreferences.getInstance();
    var name = prefs.getString('pubName') ?? 'unknown';
    var adress = await getPersonalAdress();
    var nameAndAdress = name + '||' + adress;
    print(nameAndAdress);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 377),
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
    );
  }
}

class LocalButton extends StatelessWidget {
  final Function startSearch;
  LocalButton(this.startSearch);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: () {
          startSearch();
        },
        icon: Icon(
          Icons.adjust_sharp,
        ),
        color: Theme.of(context).hoverColor,
        iconSize: MediaQuery.of(context).size.width * 0.44,
      ),
    );
  }
}

class LocalSpinKit extends StatelessWidget {
  final Function stopSearch;
  LocalSpinKit(this.stopSearch);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SpinKitRipple(
            color: Theme.of(context).hoverColor,
            duration: const Duration(milliseconds: 1597),
            size: MediaQuery.of(context).size.width * 0.64,
          ),
        ),
        Center(
          child: IconButton(
            onPressed: () {
              stopSearch();
            },
            icon: Icon(
              Icons.circle,
              color: Theme.of(context).hoverColor,
            ),
            iconSize: MediaQuery.of(context).size.width * 0.12,
          ),
        ),
      ],
    );
  }
}

class LocalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
