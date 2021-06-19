///
//  Generated code. Do not modify.
//  source: lib/api/api.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use responseDescriptor instead')
const Response$json = const {
  '1': 'Response',
  '2': const [
    const {'1': 'Passed', '3': 1, '4': 1, '5': 8, '10': 'Passed'},
  ],
};

/// Descriptor for `Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseDescriptor = $convert.base64Decode('CghSZXNwb25zZRIWCgZQYXNzZWQYASABKAhSBlBhc3NlZA==');
@$core.Deprecated('Use userCreateRequestDescriptor instead')
const UserCreateRequest$json = const {
  '1': 'UserCreateRequest',
  '2': const [
    const {'1': 'PublicKey', '3': 1, '4': 1, '5': 12, '10': 'PublicKey'},
    const {'1': 'MesssageKey', '3': 2, '4': 1, '5': 12, '10': 'MesssageKey'},
    const {'1': 'PublicName', '3': 3, '4': 1, '5': 9, '10': 'PublicName'},
    const {'1': 'Sign', '3': 4, '4': 1, '5': 12, '10': 'Sign'},
  ],
};

/// Descriptor for `UserCreateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userCreateRequestDescriptor = $convert.base64Decode('ChFVc2VyQ3JlYXRlUmVxdWVzdBIcCglQdWJsaWNLZXkYASABKAxSCVB1YmxpY0tleRIgCgtNZXNzc2FnZUtleRgCIAEoDFILTWVzc3NhZ2VLZXkSHgoKUHVibGljTmFtZRgDIAEoCVIKUHVibGljTmFtZRISCgRTaWduGAQgASgMUgRTaWdu');
@$core.Deprecated('Use userUpdateRequestDescriptor instead')
const UserUpdateRequest$json = const {
  '1': 'UserUpdateRequest',
  '2': const [
    const {'1': 'PublicKey', '3': 1, '4': 1, '5': 12, '10': 'PublicKey'},
    const {'1': 'MesssageKey', '3': 2, '4': 1, '5': 12, '10': 'MesssageKey'},
    const {'1': 'PublicName', '3': 3, '4': 1, '5': 9, '10': 'PublicName'},
    const {'1': 'Sign', '3': 4, '4': 1, '5': 12, '10': 'Sign'},
  ],
};

/// Descriptor for `UserUpdateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userUpdateRequestDescriptor = $convert.base64Decode('ChFVc2VyVXBkYXRlUmVxdWVzdBIcCglQdWJsaWNLZXkYASABKAxSCVB1YmxpY0tleRIgCgtNZXNzc2FnZUtleRgCIAEoDFILTWVzc3NhZ2VLZXkSHgoKUHVibGljTmFtZRgDIAEoCVIKUHVibGljTmFtZRISCgRTaWduGAQgASgMUgRTaWdu');
@$core.Deprecated('Use userLookRequestDescriptor instead')
const UserLookRequest$json = const {
  '1': 'UserLookRequest',
  '2': const [
    const {'1': 'Adress', '3': 1, '4': 1, '5': 12, '10': 'Adress'},
  ],
};

/// Descriptor for `UserLookRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userLookRequestDescriptor = $convert.base64Decode('Cg9Vc2VyTG9va1JlcXVlc3QSFgoGQWRyZXNzGAEgASgMUgZBZHJlc3M=');
@$core.Deprecated('Use userLookResponseDescriptor instead')
const UserLookResponse$json = const {
  '1': 'UserLookResponse',
  '2': const [
    const {'1': 'PublicName', '3': 2, '4': 1, '5': 9, '10': 'PublicName'},
  ],
};

/// Descriptor for `UserLookResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userLookResponseDescriptor = $convert.base64Decode('ChBVc2VyTG9va1Jlc3BvbnNlEh4KClB1YmxpY05hbWUYAiABKAlSClB1YmxpY05hbWU=');
@$core.Deprecated('Use userSendRequestDescriptor instead')
const UserSendRequest$json = const {
  '1': 'UserSendRequest',
  '2': const [
    const {'1': 'PublicKey', '3': 1, '4': 1, '5': 12, '10': 'PublicKey'},
    const {'1': 'SendAmount', '3': 2, '4': 1, '5': 4, '10': 'SendAmount'},
    const {'1': 'RecieverAdress', '3': 3, '4': 1, '5': 12, '10': 'RecieverAdress'},
    const {'1': 'Sign', '3': 4, '4': 1, '5': 12, '10': 'Sign'},
  ],
};

/// Descriptor for `UserSendRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userSendRequestDescriptor = $convert.base64Decode('Cg9Vc2VyU2VuZFJlcXVlc3QSHAoJUHVibGljS2V5GAEgASgMUglQdWJsaWNLZXkSHgoKU2VuZEFtb3VudBgCIAEoBFIKU2VuZEFtb3VudBImCg5SZWNpZXZlckFkcmVzcxgDIAEoDFIOUmVjaWV2ZXJBZHJlc3MSEgoEU2lnbhgEIAEoDFIEU2lnbg==');
