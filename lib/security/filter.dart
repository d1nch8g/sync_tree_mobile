library bad_words;

import 'words.dart';

/// Bad Word Filter
class Filter {
  /// isProfane returns a boolean value representing if the string provided contains a profane word
  bool isProfane(String stringToTest) {
    final lowerCaseStringToTest = stringToTest.toLowerCase();
    return wordList
        .where((word) => lowerCaseStringToTest.contains(word))
        .isNotEmpty;
  }

  /// replace tests a string, replacing bad words with an asterisk length string of equal length
  String clean(String stringToObfuscate) {
    final listToTest = stringToObfuscate.split(' ');
    final clean = listToTest.map((e) {
      if (wordSet.contains(e.toLowerCase())) {
        return e.replaceAll(RegExp('.'), '*');
      }
      return e;
    });

    return clean.join(' ');
  }

  bool checkLength(String name) {
    if (name.length < 4) {
      return false;
    }
    return true;
  }

  bool checkCharacters(String name) {
    if (name.contains(' ')) {
      return false;
    }
    if (RegExp('[a-zA-Z0-9]').hasMatch(name)) {
      return true;
    }
    return false;
  }
}
