

double intToDouble(int number, int delimiter) {
  var divider = 1;
  for (var i = 0; i < delimiter; i++) {
    divider = divider * 10;
  }
  return number / divider;
}

int doubleToInt(double number, int delimiter) {
  var divider = 1;
  for (var i = 0; i < delimiter; i++) {
    divider = divider * 10;
  }
  return (number * divider).round();
}
