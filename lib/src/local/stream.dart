import 'dart:async';

var storageStreamController = StreamController<Trigger>.broadcast();
var storageStream = storageStreamController.stream;

enum Trigger {
  publicNameUpdate,
  mainBalanceUpdate,
  marketBalanceUpdate,
  marketMessagesUpdate,
  moveToMarketPage,
}
