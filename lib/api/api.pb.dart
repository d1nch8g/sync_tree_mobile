///
//  Generated code. Do not modify.
//  source: lib/api/api.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

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

class Adress extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Adress', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Adress', $pb.PbFieldType.OY, protoName: 'Adress')
    ..hasRequiredFields = false
  ;

  Adress._() : super();
  factory Adress({
    $core.List<$core.int>? adress,
  }) {
    final _result = create();
    if (adress != null) {
      _result.adress = adress;
    }
    return _result;
  }
  factory Adress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Adress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Adress clone() => Adress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Adress copyWith(void Function(Adress) updates) => super.copyWith((message) => updates(message as Adress)) as Adress; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Adress create() => Adress._();
  Adress createEmptyInstance() => create();
  static $pb.PbList<Adress> createRepeated() => $pb.PbList<Adress>();
  @$core.pragma('dart2js:noInline')
  static Adress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Adress>(create);
  static Adress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get adress => $_getN(0);
  @$pb.TagNumber(1)
  set adress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAdress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAdress() => clearField(1);
}

class UserCreateRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserCreateRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PublicKey', $pb.PbFieldType.OY, protoName: 'PublicKey')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'MesKey', $pb.PbFieldType.OY, protoName: 'MesKey')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ImgLink', protoName: 'ImgLink')
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Sign', $pb.PbFieldType.OY, protoName: 'Sign')
    ..hasRequiredFields = false
  ;

  UserCreateRequest._() : super();
  factory UserCreateRequest({
    $core.List<$core.int>? publicKey,
    $core.List<$core.int>? mesKey,
    $core.String? imgLink,
    $core.List<$core.int>? sign,
  }) {
    final _result = create();
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    if (mesKey != null) {
      _result.mesKey = mesKey;
    }
    if (imgLink != null) {
      _result.imgLink = imgLink;
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
  $core.List<$core.int> get mesKey => $_getN(1);
  @$pb.TagNumber(2)
  set mesKey($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMesKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearMesKey() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get imgLink => $_getSZ(2);
  @$pb.TagNumber(3)
  set imgLink($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasImgLink() => $_has(2);
  @$pb.TagNumber(3)
  void clearImgLink() => clearField(3);

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

class UserLookResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserLookResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Exists', protoName: 'Exists')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ImgLink', protoName: 'ImgLink')
    ..hasRequiredFields = false
  ;

  UserLookResponse._() : super();
  factory UserLookResponse({
    $core.bool? exists,
    $core.String? imgLink,
  }) {
    final _result = create();
    if (exists != null) {
      _result.exists = exists;
    }
    if (imgLink != null) {
      _result.imgLink = imgLink;
    }
    return _result;
  }
  factory UserLookResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserLookResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserLookResponse clone() => UserLookResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserLookResponse copyWith(void Function(UserLookResponse) updates) => super.copyWith((message) => updates(message as UserLookResponse)) as UserLookResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserLookResponse create() => UserLookResponse._();
  UserLookResponse createEmptyInstance() => create();
  static $pb.PbList<UserLookResponse> createRepeated() => $pb.PbList<UserLookResponse>();
  @$core.pragma('dart2js:noInline')
  static UserLookResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserLookResponse>(create);
  static UserLookResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get exists => $_getBF(0);
  @$pb.TagNumber(1)
  set exists($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasExists() => $_has(0);
  @$pb.TagNumber(1)
  void clearExists() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get imgLink => $_getSZ(1);
  @$pb.TagNumber(2)
  set imgLink($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasImgLink() => $_has(1);
  @$pb.TagNumber(2)
  void clearImgLink() => clearField(2);
}

class MarketCraeteRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketCraeteRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PublicKey', $pb.PbFieldType.OY, protoName: 'PublicKey')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Name', protoName: 'Name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ImgLink', protoName: 'ImgLink')
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'MesKey', $pb.PbFieldType.OY, protoName: 'MesKey')
    ..a<$core.List<$core.int>>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Sign', $pb.PbFieldType.OY, protoName: 'Sign')
    ..hasRequiredFields = false
  ;

  MarketCraeteRequest._() : super();
  factory MarketCraeteRequest({
    $core.List<$core.int>? publicKey,
    $core.String? name,
    $core.String? imgLink,
    $core.List<$core.int>? mesKey,
    $core.List<$core.int>? sign,
  }) {
    final _result = create();
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    if (name != null) {
      _result.name = name;
    }
    if (imgLink != null) {
      _result.imgLink = imgLink;
    }
    if (mesKey != null) {
      _result.mesKey = mesKey;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    return _result;
  }
  factory MarketCraeteRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketCraeteRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketCraeteRequest clone() => MarketCraeteRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketCraeteRequest copyWith(void Function(MarketCraeteRequest) updates) => super.copyWith((message) => updates(message as MarketCraeteRequest)) as MarketCraeteRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketCraeteRequest create() => MarketCraeteRequest._();
  MarketCraeteRequest createEmptyInstance() => create();
  static $pb.PbList<MarketCraeteRequest> createRepeated() => $pb.PbList<MarketCraeteRequest>();
  @$core.pragma('dart2js:noInline')
  static MarketCraeteRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketCraeteRequest>(create);
  static MarketCraeteRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get publicKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicKey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get imgLink => $_getSZ(2);
  @$pb.TagNumber(3)
  set imgLink($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasImgLink() => $_has(2);
  @$pb.TagNumber(3)
  void clearImgLink() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get mesKey => $_getN(3);
  @$pb.TagNumber(4)
  set mesKey($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMesKey() => $_has(3);
  @$pb.TagNumber(4)
  void clearMesKey() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get sign => $_getN(4);
  @$pb.TagNumber(5)
  set sign($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSign() => $_has(4);
  @$pb.TagNumber(5)
  void clearSign() => clearField(5);
}

class MarketTradeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketTradeRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PublicKey', $pb.PbFieldType.OY, protoName: 'PublicKey')
    ..aOB(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isSell', protoName: 'isSell')
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Offer', $pb.PbFieldType.OU6, protoName: 'Offer', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Recieve', $pb.PbFieldType.OU6, protoName: 'Recieve', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Sign', $pb.PbFieldType.OY, protoName: 'Sign')
    ..hasRequiredFields = false
  ;

  MarketTradeRequest._() : super();
  factory MarketTradeRequest({
    $core.List<$core.int>? publicKey,
    $core.bool? isSell,
    $fixnum.Int64? offer,
    $fixnum.Int64? recieve,
    $core.List<$core.int>? sign,
  }) {
    final _result = create();
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    if (isSell != null) {
      _result.isSell = isSell;
    }
    if (offer != null) {
      _result.offer = offer;
    }
    if (recieve != null) {
      _result.recieve = recieve;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    return _result;
  }
  factory MarketTradeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketTradeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketTradeRequest clone() => MarketTradeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketTradeRequest copyWith(void Function(MarketTradeRequest) updates) => super.copyWith((message) => updates(message as MarketTradeRequest)) as MarketTradeRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketTradeRequest create() => MarketTradeRequest._();
  MarketTradeRequest createEmptyInstance() => create();
  static $pb.PbList<MarketTradeRequest> createRepeated() => $pb.PbList<MarketTradeRequest>();
  @$core.pragma('dart2js:noInline')
  static MarketTradeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketTradeRequest>(create);
  static MarketTradeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get publicKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicKey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isSell => $_getBF(1);
  @$pb.TagNumber(2)
  set isSell($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsSell() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsSell() => clearField(2);

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
  $core.List<$core.int> get sign => $_getN(4);
  @$pb.TagNumber(5)
  set sign($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSign() => $_has(4);
  @$pb.TagNumber(5)
  void clearSign() => clearField(5);
}

class MarketLookResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketLookResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Name', protoName: 'Name')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ImgLink', protoName: 'ImgLink')
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'MesKey', $pb.PbFieldType.OY, protoName: 'MesKey')
    ..a<$fixnum.Int64>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Likes', $pb.PbFieldType.OU6, protoName: 'Likes', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$fixnum.Int64>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Dislikes', $pb.PbFieldType.OU6, protoName: 'Dislikes', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'BestOfferRatio', $pb.PbFieldType.OF, protoName: 'BestOfferRatio')
    ..a<$core.double>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'BestRecieveRatio', $pb.PbFieldType.OF, protoName: 'BestRecieveRatio')
    ..hasRequiredFields = false
  ;

  MarketLookResponse._() : super();
  factory MarketLookResponse({
    $core.String? name,
    $core.String? imgLink,
    $core.List<$core.int>? mesKey,
    $fixnum.Int64? likes,
    $fixnum.Int64? dislikes,
    $core.double? bestOfferRatio,
    $core.double? bestRecieveRatio,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (imgLink != null) {
      _result.imgLink = imgLink;
    }
    if (mesKey != null) {
      _result.mesKey = mesKey;
    }
    if (likes != null) {
      _result.likes = likes;
    }
    if (dislikes != null) {
      _result.dislikes = dislikes;
    }
    if (bestOfferRatio != null) {
      _result.bestOfferRatio = bestOfferRatio;
    }
    if (bestRecieveRatio != null) {
      _result.bestRecieveRatio = bestRecieveRatio;
    }
    return _result;
  }
  factory MarketLookResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketLookResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketLookResponse clone() => MarketLookResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketLookResponse copyWith(void Function(MarketLookResponse) updates) => super.copyWith((message) => updates(message as MarketLookResponse)) as MarketLookResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketLookResponse create() => MarketLookResponse._();
  MarketLookResponse createEmptyInstance() => create();
  static $pb.PbList<MarketLookResponse> createRepeated() => $pb.PbList<MarketLookResponse>();
  @$core.pragma('dart2js:noInline')
  static MarketLookResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketLookResponse>(create);
  static MarketLookResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get imgLink => $_getSZ(1);
  @$pb.TagNumber(2)
  set imgLink($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasImgLink() => $_has(1);
  @$pb.TagNumber(2)
  void clearImgLink() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get mesKey => $_getN(2);
  @$pb.TagNumber(3)
  set mesKey($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMesKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearMesKey() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get likes => $_getI64(3);
  @$pb.TagNumber(4)
  set likes($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLikes() => $_has(3);
  @$pb.TagNumber(4)
  void clearLikes() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get dislikes => $_getI64(4);
  @$pb.TagNumber(5)
  set dislikes($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDislikes() => $_has(4);
  @$pb.TagNumber(5)
  void clearDislikes() => clearField(5);

  @$pb.TagNumber(6)
  $core.double get bestOfferRatio => $_getN(5);
  @$pb.TagNumber(6)
  set bestOfferRatio($core.double v) { $_setFloat(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasBestOfferRatio() => $_has(5);
  @$pb.TagNumber(6)
  void clearBestOfferRatio() => clearField(6);

  @$pb.TagNumber(7)
  $core.double get bestRecieveRatio => $_getN(6);
  @$pb.TagNumber(7)
  set bestRecieveRatio($core.double v) { $_setFloat(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasBestRecieveRatio() => $_has(6);
  @$pb.TagNumber(7)
  void clearBestRecieveRatio() => clearField(7);
}

