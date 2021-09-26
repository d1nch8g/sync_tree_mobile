class Balance {
  static String tooString({
    required int balance,
    required int delimiter,
  }) {
    var divider = 1;
    for (var i = 0; i < delimiter; i++) {
      divider = divider * 10;
    }
    return (balance / divider).toString();
  }

  static int fromString({
    required String balance,
    required int delimiter,
  }) {
    var doubleBalance = double.parse(balance);
    var divider = 1;
    for (var i = 0; i < delimiter; i++) {
      divider = divider * 10;
    }
    return (doubleBalance * divider).round();
  }
}
