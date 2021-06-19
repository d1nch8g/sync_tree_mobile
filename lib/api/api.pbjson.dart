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
@$core.Deprecated('Use adressDescriptor instead')
const Adress$json = const {
  '1': 'Adress',
  '2': const [
    const {'1': 'Adress', '3': 1, '4': 1, '5': 12, '10': 'Adress'},
  ],
};

/// Descriptor for `Adress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adressDescriptor = $convert.base64Decode('CgZBZHJlc3MSFgoGQWRyZXNzGAEgASgMUgZBZHJlc3M=');
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
@$core.Deprecated('Use userLookResponseDescriptor instead')
const UserLookResponse$json = const {
  '1': 'UserLookResponse',
  '2': const [
    const {'1': 'Exists', '3': 1, '4': 1, '5': 8, '10': 'Exists'},
    const {'1': 'ImgLink', '3': 2, '4': 1, '5': 9, '10': 'ImgLink'},
  ],
};

/// Descriptor for `UserLookResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userLookResponseDescriptor = $convert.base64Decode('ChBVc2VyTG9va1Jlc3BvbnNlEhYKBkV4aXN0cxgBIAEoCFIGRXhpc3RzEhgKB0ltZ0xpbmsYAiABKAlSB0ltZ0xpbms=');
@$core.Deprecated('Use marketCraeteRequestDescriptor instead')
const MarketCraeteRequest$json = const {
  '1': 'MarketCraeteRequest',
  '2': const [
    const {'1': 'PublicKey', '3': 1, '4': 1, '5': 12, '10': 'PublicKey'},
    const {'1': 'Name', '3': 2, '4': 1, '5': 9, '10': 'Name'},
    const {'1': 'ImgLink', '3': 3, '4': 1, '5': 9, '10': 'ImgLink'},
    const {'1': 'MesKey', '3': 4, '4': 1, '5': 12, '10': 'MesKey'},
    const {'1': 'Sign', '3': 5, '4': 1, '5': 12, '10': 'Sign'},
  ],
};

/// Descriptor for `MarketCraeteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketCraeteRequestDescriptor = $convert.base64Decode('ChNNYXJrZXRDcmFldGVSZXF1ZXN0EhwKCVB1YmxpY0tleRgBIAEoDFIJUHVibGljS2V5EhIKBE5hbWUYAiABKAlSBE5hbWUSGAoHSW1nTGluaxgDIAEoCVIHSW1nTGluaxIWCgZNZXNLZXkYBCABKAxSBk1lc0tleRISCgRTaWduGAUgASgMUgRTaWdu');
@$core.Deprecated('Use marketTradeRequestDescriptor instead')
const MarketTradeRequest$json = const {
  '1': 'MarketTradeRequest',
  '2': const [
    const {'1': 'PublicKey', '3': 1, '4': 1, '5': 12, '10': 'PublicKey'},
    const {'1': 'isSell', '3': 2, '4': 1, '5': 8, '10': 'isSell'},
    const {'1': 'Offer', '3': 3, '4': 1, '5': 4, '10': 'Offer'},
    const {'1': 'Recieve', '3': 4, '4': 1, '5': 4, '10': 'Recieve'},
    const {'1': 'Sign', '3': 5, '4': 1, '5': 12, '10': 'Sign'},
  ],
};

/// Descriptor for `MarketTradeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketTradeRequestDescriptor = $convert.base64Decode('ChJNYXJrZXRUcmFkZVJlcXVlc3QSHAoJUHVibGljS2V5GAEgASgMUglQdWJsaWNLZXkSFgoGaXNTZWxsGAIgASgIUgZpc1NlbGwSFAoFT2ZmZXIYAyABKARSBU9mZmVyEhgKB1JlY2lldmUYBCABKARSB1JlY2lldmUSEgoEU2lnbhgFIAEoDFIEU2lnbg==');
@$core.Deprecated('Use marketLookResponseDescriptor instead')
const MarketLookResponse$json = const {
  '1': 'MarketLookResponse',
  '2': const [
    const {'1': 'Name', '3': 1, '4': 1, '5': 9, '10': 'Name'},
    const {'1': 'ImgLink', '3': 2, '4': 1, '5': 9, '10': 'ImgLink'},
    const {'1': 'MesKey', '3': 3, '4': 1, '5': 12, '10': 'MesKey'},
    const {'1': 'Likes', '3': 4, '4': 1, '5': 4, '10': 'Likes'},
    const {'1': 'Dislikes', '3': 5, '4': 1, '5': 4, '10': 'Dislikes'},
    const {'1': 'BestOfferRatio', '3': 6, '4': 1, '5': 2, '10': 'BestOfferRatio'},
    const {'1': 'BestRecieveRatio', '3': 7, '4': 1, '5': 2, '10': 'BestRecieveRatio'},
  ],
};

/// Descriptor for `MarketLookResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketLookResponseDescriptor = $convert.base64Decode('ChJNYXJrZXRMb29rUmVzcG9uc2USEgoETmFtZRgBIAEoCVIETmFtZRIYCgdJbWdMaW5rGAIgASgJUgdJbWdMaW5rEhYKBk1lc0tleRgDIAEoDFIGTWVzS2V5EhQKBUxpa2VzGAQgASgEUgVMaWtlcxIaCghEaXNsaWtlcxgFIAEoBFIIRGlzbGlrZXMSJgoOQmVzdE9mZmVyUmF0aW8YBiABKAJSDkJlc3RPZmZlclJhdGlvEioKEEJlc3RSZWNpZXZlUmF0aW8YByABKAJSEEJlc3RSZWNpZXZlUmF0aW8=');
