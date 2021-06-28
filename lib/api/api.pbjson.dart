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
@$core.Deprecated('Use messagesDescriptor instead')
const Messages$json = const {
  '1': 'Messages',
  '2': const [
    const {'1': 'sender', '3': 1, '4': 1, '5': 12, '10': 'sender'},
  ],
};

/// Descriptor for `Messages`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messagesDescriptor = $convert.base64Decode('CghNZXNzYWdlcxIWCgZzZW5kZXIYASABKAxSBnNlbmRlcg==');
@$core.Deprecated('Use infoUserRequestDescriptor instead')
const InfoUserRequest$json = const {
  '1': 'InfoUserRequest',
  '2': const [
    const {'1': 'Adress', '3': 1, '4': 1, '5': 12, '10': 'Adress'},
  ],
};

/// Descriptor for `InfoUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List infoUserRequestDescriptor = $convert.base64Decode('Cg9JbmZvVXNlclJlcXVlc3QSFgoGQWRyZXNzGAEgASgMUgZBZHJlc3M=');
@$core.Deprecated('Use infoMarketRequestDescriptor instead')
const InfoMarketRequest$json = const {
  '1': 'InfoMarketRequest',
  '2': const [
    const {'1': 'Adress', '3': 1, '4': 1, '5': 12, '10': 'Adress'},
  ],
};

/// Descriptor for `InfoMarketRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List infoMarketRequestDescriptor = $convert.base64Decode('ChFJbmZvTWFya2V0UmVxdWVzdBIWCgZBZHJlc3MYASABKAxSBkFkcmVzcw==');
@$core.Deprecated('Use infoFindRequestDescriptor instead')
const InfoFindRequest$json = const {
  '1': 'InfoFindRequest',
  '2': const [
    const {'1': 'info', '3': 1, '4': 1, '5': 9, '10': 'info'},
  ],
};

/// Descriptor for `InfoFindRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List infoFindRequestDescriptor = $convert.base64Decode('Cg9JbmZvRmluZFJlcXVlc3QSEgoEaW5mbxgBIAEoCVIEaW5mbw==');
@$core.Deprecated('Use infoUserResponseDescriptor instead')
const InfoUserResponse$json = const {
  '1': 'InfoUserResponse',
  '2': const [
    const {'1': 'PublicName', '3': 1, '4': 1, '5': 9, '10': 'PublicName'},
    const {'1': 'Balance', '3': 2, '4': 1, '5': 4, '10': 'Balance'},
    const {'1': 'mesKey', '3': 3, '4': 1, '5': 12, '10': 'mesKey'},
  ],
};

/// Descriptor for `InfoUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List infoUserResponseDescriptor = $convert.base64Decode('ChBJbmZvVXNlclJlc3BvbnNlEh4KClB1YmxpY05hbWUYASABKAlSClB1YmxpY05hbWUSGAoHQmFsYW5jZRgCIAEoBFIHQmFsYW5jZRIWCgZtZXNLZXkYAyABKAxSBm1lc0tleQ==');
@$core.Deprecated('Use infoMarketResponseDescriptor instead')
const InfoMarketResponse$json = const {
  '1': 'InfoMarketResponse',
  '2': const [
    const {'1': 'MesssageKey', '3': 1, '4': 1, '5': 12, '10': 'MesssageKey'},
    const {'1': 'Name', '3': 2, '4': 1, '5': 9, '10': 'Name'},
    const {'1': 'Img', '3': 3, '4': 1, '5': 9, '10': 'Img'},
    const {'1': 'Descr', '3': 4, '4': 1, '5': 9, '10': 'Descr'},
    const {'1': 'OpCount', '3': 5, '4': 1, '5': 4, '10': 'OpCount'},
  ],
};

/// Descriptor for `InfoMarketResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List infoMarketResponseDescriptor = $convert.base64Decode('ChJJbmZvTWFya2V0UmVzcG9uc2USIAoLTWVzc3NhZ2VLZXkYASABKAxSC01lc3NzYWdlS2V5EhIKBE5hbWUYAiABKAlSBE5hbWUSEAoDSW1nGAMgASgJUgNJbWcSFAoFRGVzY3IYBCABKAlSBURlc2NyEhgKB09wQ291bnQYBSABKARSB09wQ291bnQ=');
@$core.Deprecated('Use infoFindResponseDescriptor instead')
const InfoFindResponse$json = const {
  '1': 'InfoFindResponse',
  '2': const [
    const {'1': 'ConcMarkets', '3': 1, '4': 1, '5': 12, '10': 'ConcMarkets'},
  ],
};

/// Descriptor for `InfoFindResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List infoFindResponseDescriptor = $convert.base64Decode('ChBJbmZvRmluZFJlc3BvbnNlEiAKC0NvbmNNYXJrZXRzGAEgASgMUgtDb25jTWFya2V0cw==');
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
@$core.Deprecated('Use userInfoRequestDescriptor instead')
const UserInfoRequest$json = const {
  '1': 'UserInfoRequest',
  '2': const [
    const {'1': 'Adress', '3': 1, '4': 1, '5': 12, '10': 'Adress'},
  ],
};

/// Descriptor for `UserInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userInfoRequestDescriptor = $convert.base64Decode('Cg9Vc2VySW5mb1JlcXVlc3QSFgoGQWRyZXNzGAEgASgMUgZBZHJlc3M=');
@$core.Deprecated('Use userTradeRequestDescriptor instead')
const UserTradeRequest$json = const {
  '1': 'UserTradeRequest',
  '2': const [
    const {'1': 'PublicKey', '3': 1, '4': 1, '5': 12, '10': 'PublicKey'},
    const {'1': 'MarketAdress', '3': 2, '4': 1, '5': 12, '10': 'MarketAdress'},
    const {'1': 'Offer', '3': 3, '4': 1, '5': 4, '10': 'Offer'},
    const {'1': 'Recieve', '3': 4, '4': 1, '5': 4, '10': 'Recieve'},
    const {'1': 'IsSell', '3': 5, '4': 1, '5': 8, '10': 'IsSell'},
    const {'1': 'Sign', '3': 6, '4': 1, '5': 12, '10': 'Sign'},
  ],
};

/// Descriptor for `UserTradeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userTradeRequestDescriptor = $convert.base64Decode('ChBVc2VyVHJhZGVSZXF1ZXN0EhwKCVB1YmxpY0tleRgBIAEoDFIJUHVibGljS2V5EiIKDE1hcmtldEFkcmVzcxgCIAEoDFIMTWFya2V0QWRyZXNzEhQKBU9mZmVyGAMgASgEUgVPZmZlchIYCgdSZWNpZXZlGAQgASgEUgdSZWNpZXZlEhYKBklzU2VsbBgFIAEoCFIGSXNTZWxsEhIKBFNpZ24YBiABKAxSBFNpZ24=');
@$core.Deprecated('Use userCancelTradeRequestDescriptor instead')
const UserCancelTradeRequest$json = const {
  '1': 'UserCancelTradeRequest',
  '2': const [
    const {'1': 'PublicKey', '3': 1, '4': 1, '5': 12, '10': 'PublicKey'},
    const {'1': 'MarketAdress', '3': 2, '4': 1, '5': 12, '10': 'MarketAdress'},
    const {'1': 'Sign', '3': 3, '4': 1, '5': 12, '10': 'Sign'},
  ],
};

/// Descriptor for `UserCancelTradeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userCancelTradeRequestDescriptor = $convert.base64Decode('ChZVc2VyQ2FuY2VsVHJhZGVSZXF1ZXN0EhwKCVB1YmxpY0tleRgBIAEoDFIJUHVibGljS2V5EiIKDE1hcmtldEFkcmVzcxgCIAEoDFIMTWFya2V0QWRyZXNzEhIKBFNpZ24YAyABKAxSBFNpZ24=');
@$core.Deprecated('Use userDepositRequestDescriptor instead')
const UserDepositRequest$json = const {
  '1': 'UserDepositRequest',
  '2': const [
    const {'1': 'PublicKey', '3': 1, '4': 1, '5': 12, '10': 'PublicKey'},
    const {'1': 'MarketAdress', '3': 2, '4': 1, '5': 12, '10': 'MarketAdress'},
    const {'1': 'Amount', '3': 3, '4': 1, '5': 4, '10': 'Amount'},
    const {'1': 'Sign', '3': 4, '4': 1, '5': 12, '10': 'Sign'},
  ],
};

/// Descriptor for `UserDepositRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userDepositRequestDescriptor = $convert.base64Decode('ChJVc2VyRGVwb3NpdFJlcXVlc3QSHAoJUHVibGljS2V5GAEgASgMUglQdWJsaWNLZXkSIgoMTWFya2V0QWRyZXNzGAIgASgMUgxNYXJrZXRBZHJlc3MSFgoGQW1vdW50GAMgASgEUgZBbW91bnQSEgoEU2lnbhgEIAEoDFIEU2lnbg==');
@$core.Deprecated('Use userWithdrawalRequestDescriptor instead')
const UserWithdrawalRequest$json = const {
  '1': 'UserWithdrawalRequest',
  '2': const [
    const {'1': 'PublicKey', '3': 1, '4': 1, '5': 12, '10': 'PublicKey'},
    const {'1': 'MarketAdress', '3': 2, '4': 1, '5': 12, '10': 'MarketAdress'},
    const {'1': 'Amount', '3': 3, '4': 1, '5': 4, '10': 'Amount'},
    const {'1': 'Sign', '3': 4, '4': 1, '5': 12, '10': 'Sign'},
  ],
};

/// Descriptor for `UserWithdrawalRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userWithdrawalRequestDescriptor = $convert.base64Decode('ChVVc2VyV2l0aGRyYXdhbFJlcXVlc3QSHAoJUHVibGljS2V5GAEgASgMUglQdWJsaWNLZXkSIgoMTWFya2V0QWRyZXNzGAIgASgMUgxNYXJrZXRBZHJlc3MSFgoGQW1vdW50GAMgASgEUgZBbW91bnQSEgoEU2lnbhgEIAEoDFIEU2lnbg==');
@$core.Deprecated('Use userSearchRequestDescriptor instead')
const UserSearchRequest$json = const {
  '1': 'UserSearchRequest',
  '2': const [
    const {'1': 'Name', '3': 1, '4': 1, '5': 9, '10': 'Name'},
  ],
};

/// Descriptor for `UserSearchRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userSearchRequestDescriptor = $convert.base64Decode('ChFVc2VyU2VhcmNoUmVxdWVzdBISCgROYW1lGAEgASgJUgROYW1l');
@$core.Deprecated('Use userSendMessageRequestDescriptor instead')
const UserSendMessageRequest$json = const {
  '1': 'UserSendMessageRequest',
  '2': const [
    const {'1': 'PublicKey', '3': 1, '4': 1, '5': 12, '10': 'PublicKey'},
    const {'1': 'Adress', '3': 2, '4': 1, '5': 12, '10': 'Adress'},
    const {'1': 'Message', '3': 3, '4': 1, '5': 9, '10': 'Message'},
    const {'1': 'Sign', '3': 4, '4': 1, '5': 12, '10': 'Sign'},
  ],
};

/// Descriptor for `UserSendMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userSendMessageRequestDescriptor = $convert.base64Decode('ChZVc2VyU2VuZE1lc3NhZ2VSZXF1ZXN0EhwKCVB1YmxpY0tleRgBIAEoDFIJUHVibGljS2V5EhYKBkFkcmVzcxgCIAEoDFIGQWRyZXNzEhgKB01lc3NhZ2UYAyABKAlSB01lc3NhZ2USEgoEU2lnbhgEIAEoDFIEU2lnbg==');
@$core.Deprecated('Use userGetMessagesRequestDescriptor instead')
const UserGetMessagesRequest$json = const {
  '1': 'UserGetMessagesRequest',
  '2': const [
    const {'1': 'Adress', '3': 1, '4': 1, '5': 12, '10': 'Adress'},
  ],
};

/// Descriptor for `UserGetMessagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userGetMessagesRequestDescriptor = $convert.base64Decode('ChZVc2VyR2V0TWVzc2FnZXNSZXF1ZXN0EhYKBkFkcmVzcxgBIAEoDFIGQWRyZXNz');
@$core.Deprecated('Use marketCreateRequestDescriptor instead')
const MarketCreateRequest$json = const {
  '1': 'MarketCreateRequest',
  '2': const [
    const {'1': 'PublicKey', '3': 1, '4': 1, '5': 12, '10': 'PublicKey'},
    const {'1': 'MesssageKey', '3': 2, '4': 1, '5': 12, '10': 'MesssageKey'},
    const {'1': 'Name', '3': 3, '4': 1, '5': 9, '10': 'Name'},
    const {'1': 'Img', '3': 4, '4': 1, '5': 9, '10': 'Img'},
    const {'1': 'Descr', '3': 5, '4': 1, '5': 9, '10': 'Descr'},
    const {'1': 'Sign', '3': 6, '4': 1, '5': 12, '10': 'Sign'},
  ],
};

/// Descriptor for `MarketCreateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketCreateRequestDescriptor = $convert.base64Decode('ChNNYXJrZXRDcmVhdGVSZXF1ZXN0EhwKCVB1YmxpY0tleRgBIAEoDFIJUHVibGljS2V5EiAKC01lc3NzYWdlS2V5GAIgASgMUgtNZXNzc2FnZUtleRISCgROYW1lGAMgASgJUgROYW1lEhAKA0ltZxgEIAEoCVIDSW1nEhQKBURlc2NyGAUgASgJUgVEZXNjchISCgRTaWduGAYgASgMUgRTaWdu');
@$core.Deprecated('Use marketUpdateRequestDescriptor instead')
const MarketUpdateRequest$json = const {
  '1': 'MarketUpdateRequest',
  '2': const [
    const {'1': 'PublicKey', '3': 1, '4': 1, '5': 12, '10': 'PublicKey'},
    const {'1': 'MesssageKey', '3': 2, '4': 1, '5': 12, '10': 'MesssageKey'},
    const {'1': 'Name', '3': 3, '4': 1, '5': 9, '10': 'Name'},
    const {'1': 'Img', '3': 4, '4': 1, '5': 9, '10': 'Img'},
    const {'1': 'Descr', '3': 5, '4': 1, '5': 9, '10': 'Descr'},
    const {'1': 'Sign', '3': 6, '4': 1, '5': 12, '10': 'Sign'},
  ],
};

/// Descriptor for `MarketUpdateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketUpdateRequestDescriptor = $convert.base64Decode('ChNNYXJrZXRVcGRhdGVSZXF1ZXN0EhwKCVB1YmxpY0tleRgBIAEoDFIJUHVibGljS2V5EiAKC01lc3NzYWdlS2V5GAIgASgMUgtNZXNzc2FnZUtleRISCgROYW1lGAMgASgJUgROYW1lEhAKA0ltZxgEIAEoCVIDSW1nEhQKBURlc2NyGAUgASgJUgVEZXNjchISCgRTaWduGAYgASgMUgRTaWdu');
@$core.Deprecated('Use marketInfoRequestDescriptor instead')
const MarketInfoRequest$json = const {
  '1': 'MarketInfoRequest',
  '2': const [
    const {'1': 'adress', '3': 1, '4': 1, '5': 12, '10': 'adress'},
  ],
};

/// Descriptor for `MarketInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketInfoRequestDescriptor = $convert.base64Decode('ChFNYXJrZXRJbmZvUmVxdWVzdBIWCgZhZHJlc3MYASABKAxSBmFkcmVzcw==');
@$core.Deprecated('Use marketDepositRequestDescriptor instead')
const MarketDepositRequest$json = const {
  '1': 'MarketDepositRequest',
  '2': const [
    const {'1': 'PublicKey', '3': 1, '4': 1, '5': 12, '10': 'PublicKey'},
    const {'1': 'UserAdress', '3': 2, '4': 1, '5': 12, '10': 'UserAdress'},
    const {'1': 'Amount', '3': 3, '4': 1, '5': 4, '10': 'Amount'},
    const {'1': 'Sign', '3': 4, '4': 1, '5': 12, '10': 'Sign'},
  ],
};

/// Descriptor for `MarketDepositRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketDepositRequestDescriptor = $convert.base64Decode('ChRNYXJrZXREZXBvc2l0UmVxdWVzdBIcCglQdWJsaWNLZXkYASABKAxSCVB1YmxpY0tleRIeCgpVc2VyQWRyZXNzGAIgASgMUgpVc2VyQWRyZXNzEhYKBkFtb3VudBgDIAEoBFIGQW1vdW50EhIKBFNpZ24YBCABKAxSBFNpZ24=');
@$core.Deprecated('Use marketWithdrawalRequestDescriptor instead')
const MarketWithdrawalRequest$json = const {
  '1': 'MarketWithdrawalRequest',
  '2': const [
    const {'1': 'PublicKey', '3': 1, '4': 1, '5': 12, '10': 'PublicKey'},
    const {'1': 'UserAdress', '3': 2, '4': 1, '5': 12, '10': 'UserAdress'},
    const {'1': 'Amount', '3': 3, '4': 1, '5': 4, '10': 'Amount'},
    const {'1': 'Sign', '3': 4, '4': 1, '5': 12, '10': 'Sign'},
  ],
};

/// Descriptor for `MarketWithdrawalRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketWithdrawalRequestDescriptor = $convert.base64Decode('ChdNYXJrZXRXaXRoZHJhd2FsUmVxdWVzdBIcCglQdWJsaWNLZXkYASABKAxSCVB1YmxpY0tleRIeCgpVc2VyQWRyZXNzGAIgASgMUgpVc2VyQWRyZXNzEhYKBkFtb3VudBgDIAEoBFIGQW1vdW50EhIKBFNpZ24YBCABKAxSBFNpZ24=');
@$core.Deprecated('Use marketSendMessageRequestDescriptor instead')
const MarketSendMessageRequest$json = const {
  '1': 'MarketSendMessageRequest',
  '2': const [
    const {'1': 'PublicKey', '3': 1, '4': 1, '5': 12, '10': 'PublicKey'},
    const {'1': 'Adress', '3': 2, '4': 1, '5': 12, '10': 'Adress'},
    const {'1': 'Message', '3': 3, '4': 1, '5': 9, '10': 'Message'},
    const {'1': 'Sign', '3': 4, '4': 1, '5': 12, '10': 'Sign'},
  ],
};

/// Descriptor for `MarketSendMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketSendMessageRequestDescriptor = $convert.base64Decode('ChhNYXJrZXRTZW5kTWVzc2FnZVJlcXVlc3QSHAoJUHVibGljS2V5GAEgASgMUglQdWJsaWNLZXkSFgoGQWRyZXNzGAIgASgMUgZBZHJlc3MSGAoHTWVzc2FnZRgDIAEoCVIHTWVzc2FnZRISCgRTaWduGAQgASgMUgRTaWdu');
@$core.Deprecated('Use marketGetMessagesRequestDescriptor instead')
const MarketGetMessagesRequest$json = const {
  '1': 'MarketGetMessagesRequest',
  '2': const [
    const {'1': 'Adress', '3': 1, '4': 1, '5': 12, '10': 'Adress'},
  ],
};

/// Descriptor for `MarketGetMessagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List marketGetMessagesRequestDescriptor = $convert.base64Decode('ChhNYXJrZXRHZXRNZXNzYWdlc1JlcXVlc3QSFgoGQWRyZXNzGAEgASgMUgZBZHJlc3M=');
