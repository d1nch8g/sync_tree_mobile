import 'package:flutter_test/flutter_test.dart';
import 'package:sync_tree_modile_ui/src/src.dart';

void main() {
  test('filter profanity check', () {
    var checked = Filter.operateCheck('shit');
    if (checked != 'name contains profane words') {
      fail('filter did not detect bad word');
    }
  });
  test('filter check short name', () {
    var checked = Filter.operateCheck('shr');
    if (checked != 'name is too short') {
      fail('filter did not detect too short name');
    }
  });
  test('filter wierd symbols check', () {
    var checked = Filter.operateCheck('71827&!@#*sad');
    if (checked == 'name contains bad letters') {
      fail('filter did not detect bad symbols');
    }
  });
  test('filter check long name', () {
    var checked = Filter.operateCheck('askjdbaskjdnkasjdnasdnjkkj');
    if (checked != 'name is too long') {
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
