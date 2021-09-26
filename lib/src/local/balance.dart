

double toVisible(int number, int delimiter) {
  var divider = 1;
  for (var i = 0; i < delimiter; i++) {
    divider = divider * 10;
  }
  return number / divider;
}

int fromInput(double number, int delimiter) {
  var divider = 1;
  for (var i = 0; i < delimiter; i++) {
    divider = divider * 10;
  }
  return (number * divider).round();
}
