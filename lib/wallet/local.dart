import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sync_tree_mobile/crypt.dart';

class LocalWallets extends StatefulWidget {
  @override
  _LocalWalletsState createState() => _LocalWalletsState();
}

class _LocalWalletsState extends State<LocalWallets> {
  final List<String> foundConnections = [];
  late Widget devicesAround;

  @override
  void initState() {
    super.initState();
    devicesAround = LocalButton(() {
      startSearch();
    });
  }

  void startSearch() async {
    setState(() {
      devicesAround = LocalSpinKit();
    });
    var prefs = await SharedPreferences.getInstance();
    var name = prefs.getString('pubName') ?? 'unknown';
    var adress = await Crypt().getPersonalAdress();
    var nameAndAdress = name + '|||' + adress;
    
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 610),
        child: devicesAround,
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
          Icons.adjust_rounded,
        ),
        color: Theme.of(context).hoverColor,
        iconSize: MediaQuery.of(context).size.width * 0.62,
      ),
    );
  }
}

class LocalSpinKit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitRipple(
      color: Theme.of(context).hoverColor,
      duration: const Duration(milliseconds: 1597),
      size: MediaQuery.of(context).size.width * 0.64,
    );
  }
}

class LocalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
