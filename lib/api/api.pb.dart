///
//  Generated code. Do not modify.
//  source: lib/api/api.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

class MessageRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MessageRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'SenderPublicKey', $pb.PbFieldType.OY, protoName: 'SenderPublicKey')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Contents', protoName: 'Contents')
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Sign', $pb.PbFieldType.OY, protoName: 'Sign')
    ..hasRequiredFields = false
  ;

  MessageRequest._() : super();
  factory MessageRequest({
    $core.List<$core.int>? senderPublicKey,
    $core.String? contents,
    $core.List<$core.int>? sign,
  }) {
    final _result = create();
    if (senderPublicKey != null) {
      _result.senderPublicKey = senderPublicKey;
    }
    if (contents != null) {
      _result.contents = contents;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    return _result;
  }
  factory MessageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MessageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MessageRequest clone() => MessageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MessageRequest copyWith(void Function(MessageRequest) updates) => super.copyWith((message) => updates(message as MessageRequest)) as MessageRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MessageRequest create() => MessageRequest._();
  MessageRequest createEmptyInstance() => create();
  static $pb.PbList<MessageRequest> createRepeated() => $pb.PbList<MessageRequest>();
  @$core.pragma('dart2js:noInline')
  static MessageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MessageRequest>(create);
  static MessageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get senderPublicKey => $_getN(0);
  @$pb.TagNumber(1)
  set senderPublicKey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSenderPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearSenderPublicKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get contents => $_getSZ(1);
  @$pb.TagNumber(2)
  set contents($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContents() => $_has(1);
  @$pb.TagNumber(2)
  void clearContents() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get sign => $_getN(2);
  @$pb.TagNumber(3)
  set sign($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSign() => $_has(2);
  @$pb.TagNumber(3)
  void clearSign() => clearField(3);
}

class Response extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Response', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Passed', protoName: 'Passed')
    ..hasRequiredFields = false
  ;

  Response._() : super();
  factory Response({
    $core.bool? passed,
  }) {
    final _result = create();
    if (passed != null) {
      _result.passed = passed;
    }
    return _result;
  }
  factory Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Response clone() => Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Response copyWith(void Function(Response) updates) => super.copyWith((message) => updates(message as Response)) as Response; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Response create() => Response._();
  Response createEmptyInstance() => create();
  static $pb.PbList<Response> createRepeated() => $pb.PbList<Response>();
  @$core.pragma('dart2js:noInline')
  static Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Response>(create);
  static Response? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get passed => $_getBF(0);
  @$pb.TagNumber(1)
  set passed($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPassed() => $_has(0);
  @$pb.TagNumber(1)
  void clearPassed() => clearField(1);
}

class UserCreateRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserCreateRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PublicKey', $pb.PbFieldType.OY, protoName: 'PublicKey')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'MesssageKey', $pb.PbFieldType.OY, protoName: 'MesssageKey')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PublicName', protoName: 'PublicName')
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Sign', $pb.PbFieldType.OY, protoName: 'Sign')
    ..hasRequiredFields = false
  ;

  UserCreateRequest._() : super();
  factory UserCreateRequest({
    $core.List<$core.int>? publicKey,
    $core.List<$core.int>? messsageKey,
    $core.String? publicName,
    $core.List<$core.int>? sign,
  }) {
    final _result = create();
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    if (messsageKey != null) {
      _result.messsageKey = messsageKey;
    }
    if (publicName != null) {
      _result.publicName = publicName;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    return _result;
  }
  factory UserCreateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserCreateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserCreateRequest clone() => UserCreateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserCreateRequest copyWith(void Function(UserCreateRequest) updates) => super.copyWith((message) => updates(message as UserCreateRequest)) as UserCreateRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserCreateRequest create() => UserCreateRequest._();
  UserCreateRequest createEmptyInstance() => create();
  static $pb.PbList<UserCreateRequest> createRepeated() => $pb.PbList<UserCreateRequest>();
  @$core.pragma('dart2js:noInline')
  static UserCreateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserCreateRequest>(create);
  static UserCreateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get publicKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicKey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get messsageKey => $_getN(1);
  @$pb.TagNumber(2)
  set messsageKey($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMesssageKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearMesssageKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get publicName => $_getSZ(2);
  @$pb.TagNumber(3)
  set publicName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPublicName() => $_has(2);
  @$pb.TagNumber(3)
  void clearPublicName() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get sign => $_getN(3);
  @$pb.TagNumber(4)
  set sign($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSign() => $_has(3);
  @$pb.TagNumber(4)
  void clearSign() => clearField(4);
}

class UserUpdateRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserUpdateRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PublicKey', $pb.PbFieldType.OY, protoName: 'PublicKey')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'MesssageKey', $pb.PbFieldType.OY, protoName: 'MesssageKey')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PublicName', protoName: 'PublicName')
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Sign', $pb.PbFieldType.OY, protoName: 'Sign')
    ..hasRequiredFields = false
  ;

  UserUpdateRequest._() : super();
  factory UserUpdateRequest({
    $core.List<$core.int>? publicKey,
    $core.List<$core.int>? messsageKey,
    $core.String? publicName,
    $core.List<$core.int>? sign,
  }) {
    final _result = create();
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    if (messsageKey != null) {
      _result.messsageKey = messsageKey;
    }
    if (publicName != null) {
      _result.publicName = publicName;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    return _result;
  }
  factory UserUpdateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserUpdateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserUpdateRequest clone() => UserUpdateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserUpdateRequest copyWith(void Function(UserUpdateRequest) updates) => super.copyWith((message) => updates(message as UserUpdateRequest)) as UserUpdateRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserUpdateRequest create() => UserUpdateRequest._();
  UserUpdateRequest createEmptyInstance() => create();
  static $pb.PbList<UserUpdateRequest> createRepeated() => $pb.PbList<UserUpdateRequest>();
  @$core.pragma('dart2js:noInline')
  static UserUpdateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserUpdateRequest>(create);
  static UserUpdateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get publicKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicKey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get messsageKey => $_getN(1);
  @$pb.TagNumber(2)
  set messsageKey($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMesssageKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearMesssageKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get publicName => $_getSZ(2);
  @$pb.TagNumber(3)
  set publicName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPublicName() => $_has(2);
  @$pb.TagNumber(3)
  void clearPublicName() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get sign => $_getN(3);
  @$pb.TagNumber(4)
  set sign($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSign() => $_has(3);
  @$pb.TagNumber(4)
  void clearSign() => clearField(4);
}

class UserSendRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserSendRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PublicKey', $pb.PbFieldType.OY, protoName: 'PublicKey')
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'SendAmount', $pb.PbFieldType.OU6, protoName: 'SendAmount', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'RecieverAdress', $pb.PbFieldType.OY, protoName: 'RecieverAdress')
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Sign', $pb.PbFieldType.OY, protoName: 'Sign')
    ..hasRequiredFields = false
  ;

  UserSendRequest._() : super();
  factory UserSendRequest({
    $core.List<$core.int>? publicKey,
    $fixnum.Int64? sendAmount,
    $core.List<$core.int>? recieverAdress,
    $core.List<$core.int>? sign,
  }) {
    final _result = create();
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    if (sendAmount != null) {
      _result.sendAmount = sendAmount;
    }
    if (recieverAdress != null) {
      _result.recieverAdress = recieverAdress;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    return _result;
  }
  factory UserSendRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserSendRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserSendRequest clone() => UserSendRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserSendRequest copyWith(void Function(UserSendRequest) updates) => super.copyWith((message) => updates(message as UserSendRequest)) as UserSendRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserSendRequest create() => UserSendRequest._();
  UserSendRequest createEmptyInstance() => create();
  static $pb.PbList<UserSendRequest> createRepeated() => $pb.PbList<UserSendRequest>();
  @$core.pragma('dart2js:noInline')
  static UserSendRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserSendRequest>(create);
  static UserSendRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get publicKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicKey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get sendAmount => $_getI64(1);
  @$pb.TagNumber(2)
  set sendAmount($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSendAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearSendAmount() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get recieverAdress => $_getN(2);
  @$pb.TagNumber(3)
  set recieverAdress($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRecieverAdress() => $_has(2);
  @$pb.TagNumber(3)
  void clearRecieverAdress() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get sign => $_getN(3);
  @$pb.TagNumber(4)
  set sign($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSign() => $_has(3);
  @$pb.TagNumber(4)
  void clearSign() => clearField(4);
}

class UserInfoRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserInfoRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Adress', $pb.PbFieldType.OY, protoName: 'Adress')
    ..hasRequiredFields = false
  ;

  UserInfoRequest._() : super();
  factory UserInfoRequest({
    $core.List<$core.int>? adress,
  }) {
    final _result = create();
    if (adress != null) {
      _result.adress = adress;
    }
    return _result;
  }
  factory UserInfoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserInfoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserInfoRequest clone() => UserInfoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserInfoRequest copyWith(void Function(UserInfoRequest) updates) => super.copyWith((message) => updates(message as UserInfoRequest)) as UserInfoRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserInfoRequest create() => UserInfoRequest._();
  UserInfoRequest createEmptyInstance() => create();
  static $pb.PbList<UserInfoRequest> createRepeated() => $pb.PbList<UserInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static UserInfoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserInfoRequest>(create);
  static UserInfoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get adress => $_getN(0);
  @$pb.TagNumber(1)
  set adress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAdress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAdress() => clearField(1);
}

class UserInfoResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserInfoResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PublicName', protoName: 'PublicName')
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Balance', $pb.PbFieldType.OU6, protoName: 'Balance', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  UserInfoResponse._() : super();
  factory UserInfoResponse({
    $core.String? publicName,
    $fixnum.Int64? balance,
  }) {
    final _result = create();
    if (publicName != null) {
      _result.publicName = publicName;
    }
    if (balance != null) {
      _result.balance = balance;
    }
    return _result;
  }
  factory UserInfoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserInfoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserInfoResponse clone() => UserInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserInfoResponse copyWith(void Function(UserInfoResponse) updates) => super.copyWith((message) => updates(message as UserInfoResponse)) as UserInfoResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserInfoResponse create() => UserInfoResponse._();
  UserInfoResponse createEmptyInstance() => create();
  static $pb.PbList<UserInfoResponse> createRepeated() => $pb.PbList<UserInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static UserInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserInfoResponse>(create);
  static UserInfoResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get publicName => $_getSZ(0);
  @$pb.TagNumber(1)
  set publicName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPublicName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicName() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get balance => $_getI64(1);
  @$pb.TagNumber(2)
  set balance($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBalance() => $_has(1);
  @$pb.TagNumber(2)
  void clearBalance() => clearField(2);
}

class UserTradeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserTradeRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PublicKey', $pb.PbFieldType.OY, protoName: 'PublicKey')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'MarketAdress', $pb.PbFieldType.OY, protoName: 'MarketAdress')
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Offer', $pb.PbFieldType.OU6, protoName: 'Offer', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Recieve', $pb.PbFieldType.OU6, protoName: 'Recieve', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOB(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'IsSell', protoName: 'IsSell')
    ..a<$core.List<$core.int>>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Sign', $pb.PbFieldType.OY, protoName: 'Sign')
    ..hasRequiredFields = false
  ;

  UserTradeRequest._() : super();
  factory UserTradeRequest({
    $core.List<$core.int>? publicKey,
    $core.List<$core.int>? marketAdress,
    $fixnum.Int64? offer,
    $fixnum.Int64? recieve,
    $core.bool? isSell,
    $core.List<$core.int>? sign,
  }) {
    final _result = create();
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    if (marketAdress != null) {
      _result.marketAdress = marketAdress;
    }
    if (offer != null) {
      _result.offer = offer;
    }
    if (recieve != null) {
      _result.recieve = recieve;
    }
    if (isSell != null) {
      _result.isSell = isSell;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    return _result;
  }
  factory UserTradeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserTradeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserTradeRequest clone() => UserTradeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserTradeRequest copyWith(void Function(UserTradeRequest) updates) => super.copyWith((message) => updates(message as UserTradeRequest)) as UserTradeRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserTradeRequest create() => UserTradeRequest._();
  UserTradeRequest createEmptyInstance() => create();
  static $pb.PbList<UserTradeRequest> createRepeated() => $pb.PbList<UserTradeRequest>();
  @$core.pragma('dart2js:noInline')
  static UserTradeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserTradeRequest>(create);
  static UserTradeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get publicKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicKey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get marketAdress => $_getN(1);
  @$pb.TagNumber(2)
  set marketAdress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMarketAdress() => $_has(1);
  @$pb.TagNumber(2)
  void clearMarketAdress() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get offer => $_getI64(2);
  @$pb.TagNumber(3)
  set offer($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOffer() => $_has(2);
  @$pb.TagNumber(3)
  void clearOffer() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get recieve => $_getI64(3);
  @$pb.TagNumber(4)
  set recieve($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasRecieve() => $_has(3);
  @$pb.TagNumber(4)
  void clearRecieve() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isSell => $_getBF(4);
  @$pb.TagNumber(5)
  set isSell($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsSell() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsSell() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get sign => $_getN(5);
  @$pb.TagNumber(6)
  set sign($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSign() => $_has(5);
  @$pb.TagNumber(6)
  void clearSign() => clearField(6);
}

class UserCancelTradeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserCancelTradeRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PublicKey', $pb.PbFieldType.OY, protoName: 'PublicKey')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'MarketAdress', $pb.PbFieldType.OY, protoName: 'MarketAdress')
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Sign', $pb.PbFieldType.OY, protoName: 'Sign')
    ..hasRequiredFields = false
  ;

  UserCancelTradeRequest._() : super();
  factory UserCancelTradeRequest({
    $core.List<$core.int>? publicKey,
    $core.List<$core.int>? marketAdress,
    $core.List<$core.int>? sign,
  }) {
    final _result = create();
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    if (marketAdress != null) {
      _result.marketAdress = marketAdress;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    return _result;
  }
  factory UserCancelTradeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserCancelTradeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserCancelTradeRequest clone() => UserCancelTradeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserCancelTradeRequest copyWith(void Function(UserCancelTradeRequest) updates) => super.copyWith((message) => updates(message as UserCancelTradeRequest)) as UserCancelTradeRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserCancelTradeRequest create() => UserCancelTradeRequest._();
  UserCancelTradeRequest createEmptyInstance() => create();
  static $pb.PbList<UserCancelTradeRequest> createRepeated() => $pb.PbList<UserCancelTradeRequest>();
  @$core.pragma('dart2js:noInline')
  static UserCancelTradeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserCancelTradeRequest>(create);
  static UserCancelTradeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get publicKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicKey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get marketAdress => $_getN(1);
  @$pb.TagNumber(2)
  set marketAdress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMarketAdress() => $_has(1);
  @$pb.TagNumber(2)
  void clearMarketAdress() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get sign => $_getN(2);
  @$pb.TagNumber(3)
  set sign($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSign() => $_has(2);
  @$pb.TagNumber(3)
  void clearSign() => clearField(3);
}

class UserDepositRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserDepositRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PublicKey', $pb.PbFieldType.OY, protoName: 'PublicKey')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'MarketAdress', $pb.PbFieldType.OY, protoName: 'MarketAdress')
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Amount', $pb.PbFieldType.OU6, protoName: 'Amount', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Sign', $pb.PbFieldType.OY, protoName: 'Sign')
    ..hasRequiredFields = false
  ;

  UserDepositRequest._() : super();
  factory UserDepositRequest({
    $core.List<$core.int>? publicKey,
    $core.List<$core.int>? marketAdress,
    $fixnum.Int64? amount,
    $core.List<$core.int>? sign,
  }) {
    final _result = create();
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    if (marketAdress != null) {
      _result.marketAdress = marketAdress;
    }
    if (amount != null) {
      _result.amount = amount;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    return _result;
  }
  factory UserDepositRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserDepositRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserDepositRequest clone() => UserDepositRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserDepositRequest copyWith(void Function(UserDepositRequest) updates) => super.copyWith((message) => updates(message as UserDepositRequest)) as UserDepositRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserDepositRequest create() => UserDepositRequest._();
  UserDepositRequest createEmptyInstance() => create();
  static $pb.PbList<UserDepositRequest> createRepeated() => $pb.PbList<UserDepositRequest>();
  @$core.pragma('dart2js:noInline')
  static UserDepositRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserDepositRequest>(create);
  static UserDepositRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get publicKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicKey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get marketAdress => $_getN(1);
  @$pb.TagNumber(2)
  set marketAdress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMarketAdress() => $_has(1);
  @$pb.TagNumber(2)
  void clearMarketAdress() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get sign => $_getN(3);
  @$pb.TagNumber(4)
  set sign($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSign() => $_has(3);
  @$pb.TagNumber(4)
  void clearSign() => clearField(4);
}

class UserWithDrawalRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserWithDrawalRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PublicKey', $pb.PbFieldType.OY, protoName: 'PublicKey')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'MarketAdress', $pb.PbFieldType.OY, protoName: 'MarketAdress')
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Amount', $pb.PbFieldType.OU6, protoName: 'Amount', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Sign', $pb.PbFieldType.OY, protoName: 'Sign')
    ..hasRequiredFields = false
  ;

  UserWithDrawalRequest._() : super();
  factory UserWithDrawalRequest({
    $core.List<$core.int>? publicKey,
    $core.List<$core.int>? marketAdress,
    $fixnum.Int64? amount,
    $core.List<$core.int>? sign,
  }) {
    final _result = create();
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    if (marketAdress != null) {
      _result.marketAdress = marketAdress;
    }
    if (amount != null) {
      _result.amount = amount;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    return _result;
  }
  factory UserWithDrawalRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserWithDrawalRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserWithDrawalRequest clone() => UserWithDrawalRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserWithDrawalRequest copyWith(void Function(UserWithDrawalRequest) updates) => super.copyWith((message) => updates(message as UserWithDrawalRequest)) as UserWithDrawalRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserWithDrawalRequest create() => UserWithDrawalRequest._();
  UserWithDrawalRequest createEmptyInstance() => create();
  static $pb.PbList<UserWithDrawalRequest> createRepeated() => $pb.PbList<UserWithDrawalRequest>();
  @$core.pragma('dart2js:noInline')
  static UserWithDrawalRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserWithDrawalRequest>(create);
  static UserWithDrawalRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get publicKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicKey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get marketAdress => $_getN(1);
  @$pb.TagNumber(2)
  set marketAdress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMarketAdress() => $_has(1);
  @$pb.TagNumber(2)
  void clearMarketAdress() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get sign => $_getN(3);
  @$pb.TagNumber(4)
  set sign($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSign() => $_has(3);
  @$pb.TagNumber(4)
  void clearSign() => clearField(4);
}

class UserSearchRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserSearchRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Name', protoName: 'Name')
    ..hasRequiredFields = false
  ;

  UserSearchRequest._() : super();
  factory UserSearchRequest({
    $core.String? name,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory UserSearchRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserSearchRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserSearchRequest clone() => UserSearchRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserSearchRequest copyWith(void Function(UserSearchRequest) updates) => super.copyWith((message) => updates(message as UserSearchRequest)) as UserSearchRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserSearchRequest create() => UserSearchRequest._();
  UserSearchRequest createEmptyInstance() => create();
  static $pb.PbList<UserSearchRequest> createRepeated() => $pb.PbList<UserSearchRequest>();
  @$core.pragma('dart2js:noInline')
  static UserSearchRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserSearchRequest>(create);
  static UserSearchRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

class Markets extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Markets', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Adresses', $pb.PbFieldType.OY, protoName: 'Adresses')
    ..hasRequiredFields = false
  ;

  Markets._() : super();
  factory Markets({
    $core.List<$core.int>? adresses,
  }) {
    final _result = create();
    if (adresses != null) {
      _result.adresses = adresses;
    }
    return _result;
  }
  factory Markets.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Markets.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Markets clone() => Markets()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Markets copyWith(void Function(Markets) updates) => super.copyWith((message) => updates(message as Markets)) as Markets; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Markets create() => Markets._();
  Markets createEmptyInstance() => create();
  static $pb.PbList<Markets> createRepeated() => $pb.PbList<Markets>();
  @$core.pragma('dart2js:noInline')
  static Markets getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Markets>(create);
  static Markets? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get adresses => $_getN(0);
  @$pb.TagNumber(1)
  set adresses($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAdresses() => $_has(0);
  @$pb.TagNumber(1)
  void clearAdresses() => clearField(1);
}

class MarketCreateRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketCreateRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PublicKey', $pb.PbFieldType.OY, protoName: 'PublicKey')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'MesssageKey', $pb.PbFieldType.OY, protoName: 'MesssageKey')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Name', protoName: 'Name')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Img', protoName: 'Img')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Descr', protoName: 'Descr')
    ..a<$core.List<$core.int>>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Sign', $pb.PbFieldType.OY, protoName: 'Sign')
    ..hasRequiredFields = false
  ;

  MarketCreateRequest._() : super();
  factory MarketCreateRequest({
    $core.List<$core.int>? publicKey,
    $core.List<$core.int>? messsageKey,
    $core.String? name,
    $core.String? img,
    $core.String? descr,
    $core.List<$core.int>? sign,
  }) {
    final _result = create();
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    if (messsageKey != null) {
      _result.messsageKey = messsageKey;
    }
    if (name != null) {
      _result.name = name;
    }
    if (img != null) {
      _result.img = img;
    }
    if (descr != null) {
      _result.descr = descr;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    return _result;
  }
  factory MarketCreateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketCreateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketCreateRequest clone() => MarketCreateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketCreateRequest copyWith(void Function(MarketCreateRequest) updates) => super.copyWith((message) => updates(message as MarketCreateRequest)) as MarketCreateRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketCreateRequest create() => MarketCreateRequest._();
  MarketCreateRequest createEmptyInstance() => create();
  static $pb.PbList<MarketCreateRequest> createRepeated() => $pb.PbList<MarketCreateRequest>();
  @$core.pragma('dart2js:noInline')
  static MarketCreateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketCreateRequest>(create);
  static MarketCreateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get publicKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicKey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get messsageKey => $_getN(1);
  @$pb.TagNumber(2)
  set messsageKey($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMesssageKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearMesssageKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get img => $_getSZ(3);
  @$pb.TagNumber(4)
  set img($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasImg() => $_has(3);
  @$pb.TagNumber(4)
  void clearImg() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get descr => $_getSZ(4);
  @$pb.TagNumber(5)
  set descr($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDescr() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescr() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get sign => $_getN(5);
  @$pb.TagNumber(6)
  set sign($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSign() => $_has(5);
  @$pb.TagNumber(6)
  void clearSign() => clearField(6);
}

class MarketUpdateRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketUpdateRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PublicKey', $pb.PbFieldType.OY, protoName: 'PublicKey')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'MesssageKey', $pb.PbFieldType.OY, protoName: 'MesssageKey')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Name', protoName: 'Name')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Img', protoName: 'Img')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Descr', protoName: 'Descr')
    ..a<$core.List<$core.int>>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Sign', $pb.PbFieldType.OY, protoName: 'Sign')
    ..hasRequiredFields = false
  ;

  MarketUpdateRequest._() : super();
  factory MarketUpdateRequest({
    $core.List<$core.int>? publicKey,
    $core.List<$core.int>? messsageKey,
    $core.String? name,
    $core.String? img,
    $core.String? descr,
    $core.List<$core.int>? sign,
  }) {
    final _result = create();
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    if (messsageKey != null) {
      _result.messsageKey = messsageKey;
    }
    if (name != null) {
      _result.name = name;
    }
    if (img != null) {
      _result.img = img;
    }
    if (descr != null) {
      _result.descr = descr;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    return _result;
  }
  factory MarketUpdateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketUpdateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketUpdateRequest clone() => MarketUpdateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketUpdateRequest copyWith(void Function(MarketUpdateRequest) updates) => super.copyWith((message) => updates(message as MarketUpdateRequest)) as MarketUpdateRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketUpdateRequest create() => MarketUpdateRequest._();
  MarketUpdateRequest createEmptyInstance() => create();
  static $pb.PbList<MarketUpdateRequest> createRepeated() => $pb.PbList<MarketUpdateRequest>();
  @$core.pragma('dart2js:noInline')
  static MarketUpdateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketUpdateRequest>(create);
  static MarketUpdateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get publicKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicKey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get messsageKey => $_getN(1);
  @$pb.TagNumber(2)
  set messsageKey($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMesssageKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearMesssageKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get img => $_getSZ(3);
  @$pb.TagNumber(4)
  set img($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasImg() => $_has(3);
  @$pb.TagNumber(4)
  void clearImg() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get descr => $_getSZ(4);
  @$pb.TagNumber(5)
  set descr($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDescr() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescr() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get sign => $_getN(5);
  @$pb.TagNumber(6)
  set sign($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSign() => $_has(5);
  @$pb.TagNumber(6)
  void clearSign() => clearField(6);
}

class MarketInfoRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketInfoRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'adress', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  MarketInfoRequest._() : super();
  factory MarketInfoRequest({
    $core.List<$core.int>? adress,
  }) {
    final _result = create();
    if (adress != null) {
      _result.adress = adress;
    }
    return _result;
  }
  factory MarketInfoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketInfoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketInfoRequest clone() => MarketInfoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketInfoRequest copyWith(void Function(MarketInfoRequest) updates) => super.copyWith((message) => updates(message as MarketInfoRequest)) as MarketInfoRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketInfoRequest create() => MarketInfoRequest._();
  MarketInfoRequest createEmptyInstance() => create();
  static $pb.PbList<MarketInfoRequest> createRepeated() => $pb.PbList<MarketInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static MarketInfoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketInfoRequest>(create);
  static MarketInfoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get adress => $_getN(0);
  @$pb.TagNumber(1)
  set adress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAdress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAdress() => clearField(1);
}

class MarketInfoResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketInfoResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'MesssageKey', $pb.PbFieldType.OY, protoName: 'MesssageKey')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Name', protoName: 'Name')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Img', protoName: 'Img')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Descr', protoName: 'Descr')
    ..a<$core.List<$core.int>>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Sign', $pb.PbFieldType.OY, protoName: 'Sign')
    ..hasRequiredFields = false
  ;

  MarketInfoResponse._() : super();
  factory MarketInfoResponse({
    $core.List<$core.int>? messsageKey,
    $core.String? name,
    $core.String? img,
    $core.String? descr,
    $core.List<$core.int>? sign,
  }) {
    final _result = create();
    if (messsageKey != null) {
      _result.messsageKey = messsageKey;
    }
    if (name != null) {
      _result.name = name;
    }
    if (img != null) {
      _result.img = img;
    }
    if (descr != null) {
      _result.descr = descr;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    return _result;
  }
  factory MarketInfoResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketInfoResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketInfoResponse clone() => MarketInfoResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketInfoResponse copyWith(void Function(MarketInfoResponse) updates) => super.copyWith((message) => updates(message as MarketInfoResponse)) as MarketInfoResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketInfoResponse create() => MarketInfoResponse._();
  MarketInfoResponse createEmptyInstance() => create();
  static $pb.PbList<MarketInfoResponse> createRepeated() => $pb.PbList<MarketInfoResponse>();
  @$core.pragma('dart2js:noInline')
  static MarketInfoResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketInfoResponse>(create);
  static MarketInfoResponse? _defaultInstance;

  @$pb.TagNumber(2)
  $core.List<$core.int> get messsageKey => $_getN(0);
  @$pb.TagNumber(2)
  set messsageKey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasMesssageKey() => $_has(0);
  @$pb.TagNumber(2)
  void clearMesssageKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get img => $_getSZ(2);
  @$pb.TagNumber(4)
  set img($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasImg() => $_has(2);
  @$pb.TagNumber(4)
  void clearImg() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get descr => $_getSZ(3);
  @$pb.TagNumber(5)
  set descr($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasDescr() => $_has(3);
  @$pb.TagNumber(5)
  void clearDescr() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get sign => $_getN(4);
  @$pb.TagNumber(6)
  set sign($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasSign() => $_has(4);
  @$pb.TagNumber(6)
  void clearSign() => clearField(6);
}

class MarketDepositRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketDepositRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PublicKey', $pb.PbFieldType.OY, protoName: 'PublicKey')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'UserAdress', $pb.PbFieldType.OY, protoName: 'UserAdress')
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Amount', $pb.PbFieldType.OU6, protoName: 'Amount', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Sign', $pb.PbFieldType.OY, protoName: 'Sign')
    ..hasRequiredFields = false
  ;

  MarketDepositRequest._() : super();
  factory MarketDepositRequest({
    $core.List<$core.int>? publicKey,
    $core.List<$core.int>? userAdress,
    $fixnum.Int64? amount,
    $core.List<$core.int>? sign,
  }) {
    final _result = create();
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    if (userAdress != null) {
      _result.userAdress = userAdress;
    }
    if (amount != null) {
      _result.amount = amount;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    return _result;
  }
  factory MarketDepositRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketDepositRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketDepositRequest clone() => MarketDepositRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketDepositRequest copyWith(void Function(MarketDepositRequest) updates) => super.copyWith((message) => updates(message as MarketDepositRequest)) as MarketDepositRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketDepositRequest create() => MarketDepositRequest._();
  MarketDepositRequest createEmptyInstance() => create();
  static $pb.PbList<MarketDepositRequest> createRepeated() => $pb.PbList<MarketDepositRequest>();
  @$core.pragma('dart2js:noInline')
  static MarketDepositRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketDepositRequest>(create);
  static MarketDepositRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get publicKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicKey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get userAdress => $_getN(1);
  @$pb.TagNumber(2)
  set userAdress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserAdress() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserAdress() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get sign => $_getN(3);
  @$pb.TagNumber(4)
  set sign($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSign() => $_has(3);
  @$pb.TagNumber(4)
  void clearSign() => clearField(4);
}

class MarketWithDrawalRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketWithDrawalRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PublicKey', $pb.PbFieldType.OY, protoName: 'PublicKey')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'UserAdress', $pb.PbFieldType.OY, protoName: 'UserAdress')
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Amount', $pb.PbFieldType.OU6, protoName: 'Amount', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Sign', $pb.PbFieldType.OY, protoName: 'Sign')
    ..hasRequiredFields = false
  ;

  MarketWithDrawalRequest._() : super();
  factory MarketWithDrawalRequest({
    $core.List<$core.int>? publicKey,
    $core.List<$core.int>? userAdress,
    $fixnum.Int64? amount,
    $core.List<$core.int>? sign,
  }) {
    final _result = create();
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    if (userAdress != null) {
      _result.userAdress = userAdress;
    }
    if (amount != null) {
      _result.amount = amount;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    return _result;
  }
  factory MarketWithDrawalRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketWithDrawalRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketWithDrawalRequest clone() => MarketWithDrawalRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketWithDrawalRequest copyWith(void Function(MarketWithDrawalRequest) updates) => super.copyWith((message) => updates(message as MarketWithDrawalRequest)) as MarketWithDrawalRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketWithDrawalRequest create() => MarketWithDrawalRequest._();
  MarketWithDrawalRequest createEmptyInstance() => create();
  static $pb.PbList<MarketWithDrawalRequest> createRepeated() => $pb.PbList<MarketWithDrawalRequest>();
  @$core.pragma('dart2js:noInline')
  static MarketWithDrawalRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketWithDrawalRequest>(create);
  static MarketWithDrawalRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get publicKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicKey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get userAdress => $_getN(1);
  @$pb.TagNumber(2)
  set userAdress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserAdress() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserAdress() => clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get amount => $_getI64(2);
  @$pb.TagNumber(3)
  set amount($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get sign => $_getN(3);
  @$pb.TagNumber(4)
  set sign($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSign() => $_has(3);
  @$pb.TagNumber(4)
  void clearSign() => clearField(4);
}

