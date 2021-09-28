import 'package:flutter/material.dart';

class WalletOperations extends StatelessWidget {
  final Function closeWallet;
  WalletOperations({required this.closeWallet});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Center(
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => DepositOverlay(),
                );
              },
              child: Text('deposit'),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            closeWallet();
          },
          iconSize: 52,
          color: Theme.of(context).focusColor,
          splashRadius: 38,
          icon: Icon(Icons.arrow_drop_down_circle_rounded),
        ),
        Expanded(
          child: Center(
            child: TextButton(
              onPressed: () {},
              child: Text('withdrawal'),
            ),
          ),
        ),
      ],
    );
  }
}

class DepositOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DepositOverlayState();
}

class DepositOverlayState extends State<DepositOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 377),
    );
    scaleAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );
    controller.addListener(() {
      setState(() {});
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.80,
            decoration: ShapeDecoration(
              color: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 32, 50, 22),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'RECIEVE',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Divider(color: Theme.of(context).focusColor),
                  Text(
                    'This button will copy your adress to clipboard. Give it'
                    ' to sender.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
