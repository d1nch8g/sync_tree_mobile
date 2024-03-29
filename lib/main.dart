import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(App());
  });
}
