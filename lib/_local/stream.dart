import 'dart:async';

var mainStreamController = StreamController<StreamEvent>.broadcast();
var mainStream = mainStreamController.stream;

enum StreamEvent {
  publicNameUpdate,
  mainBalanceUpdate,
  marketBalanceUpdate,
  marketMessagesUpdate,
}

void triggerEvent(StreamEvent event) {
  mainStreamController.add(event);
}
