import 'dart:async';

var mainStreamController = StreamController<Trigger>.broadcast();
var mainStream = mainStreamController.stream;

enum Trigger {
  publicNameUpdate,
  mainBalanceUpdate,
  marketBalanceUpdate,
  marketMessagesUpdate,
}

void triggerEvent(Trigger event) {
  mainStreamController.add(event);
}

void triggerListener(Trigger trigger, Function onEventAction) {
  mainStream.listen((event) {
    if (trigger == event) {
      onEventAction();
    }
  });
}
