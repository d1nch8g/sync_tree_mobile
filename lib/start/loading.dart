import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  void unfoucusWithDelay(context) {
    Future.delayed(Duration(milliseconds: 1), () {
      FocusScope.of(context).unfocus();
    });
  }

  void goToMain(context) async {
    Navigator.pushNamed(context, '/main');
  }

  @override
  Widget build(BuildContext context) {
    unfoucusWithDelay(context);
    goToMain(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('loading'),
            TextField(
              autofocus: true,
              onChanged: (e) {
                goToMain(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
