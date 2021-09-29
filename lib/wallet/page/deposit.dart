import 'package:flutter/material.dart';
import 'package:sync_tree_mobile_ui/wallet/page/frame.dart';

class DepositButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        resizekb = false;
        showDialog(
          context: context,
          builder: (_) => GetAdressOverlay(),
        ).whenComplete(() {
          resizekb = true;
        });
      },
      child: Text('deposit'),
    );
  }
}

class GetAdressOverlay extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GetAdressOverlayState();
}

class GetAdressOverlayState extends State<GetAdressOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation<double> scaleAnimation;
  final TextEditingController controller = TextEditingController();
  

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 377),
    );
    scaleAnimation = CurvedAnimation(
      parent: animController,
      curve: Curves.decelerate,
    );
    animController.addListener(() {
      setState(() {});
    });
    animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.82,
            decoration: ShapeDecoration(
              color: Theme.of(context).backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(22, 22, 22, 22),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'DEPOSIT',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Divider(color: Theme.of(context).focusColor),
                  Text(
                    'Type the amount to deposit.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(height: 18),
                  TextField(
                    controller: controller,
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    style: TextStyle(
                      color: Theme.of(context).focusColor,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(
                          color: Theme.of(context).focusColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(
                          color: Theme.of(context).focusColor,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(
                          color: Theme.of(context).focusColor,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: Theme.of(context).focusColor,
                      ),
                      hoverColor: Theme.of(context).focusColor,
                      fillColor: Theme.of(context).focusColor,
                      focusColor: Theme.of(context).focusColor,
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.cancel_rounded),
                            color: Theme.of(context).focusColor,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.check_circle_rounded),
                            color: Theme.of(context).focusColor,
                          ),
                        ],
                      ),
                    ),
                    cursorColor: Theme.of(context).focusColor,
                  ),
                  SizedBox(height: 18),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('close'),
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
