import 'dart:async';

var mainStreamController = StreamController<String>.broadcast();
var mainStream = mainStreamController.stream;