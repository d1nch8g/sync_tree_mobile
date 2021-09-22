import 'package:flutter_test/flutter_test.dart';
import '../src/src.dart';

void main() {
  test('filter profanity check', () {
    var checked = Filter.operateCheck('shit');
    if (checked != 'Name contains profane words!') {
      fail('filter did not detect bad word');
    }
  });
  test('filter check short name', () {
    var checked = Filter.operateCheck('shr');
    if (checked != 'Name is too short!') {
      fail('filter did not detect too short name');
    }
  });
  test('filter wierd symbols check', () {
    var checked = Filter.operateCheck('71827&!@#*sad');
    if (checked == 'Name contains bad letters!') {
      fail('filter did not detect bad symbols');
    }
  });
  test('filter check long name', () {
    var checked = Filter.operateCheck('askjdbaskjdnkasjdnasdnjkkj');
    if (checked != 'Name is too long!') {
      fail('fitler did not detect too long name');
    }
  });
  test('filter normal name check', () {
    var checked = Filter.operateCheck('NormalName');
    if (checked != '') {
      fail('this is normal name and should not cause any errors');
    }
  });
}
