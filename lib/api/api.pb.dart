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

class Messages extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Messages', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sender', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  Messages._() : super();
  factory Messages({
    $core.List<$core.int>? sender,
  }) {
    final _result = create();
    if (sender != null) {
      _result.sender = sender;
    }
    return _result;
  }
  factory Messages.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Messages.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Messages clone() => Messages()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Messages copyWith(void Function(Messages) updates) => super.copyWith((message) => updates(message as Messages)) as Messages; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Messages create() => Messages._();
  Messages createEmptyInstance() => create();
  static $pb.PbList<Messages> createRepeated() => $pb.PbList<Messages>();
  @$core.pragma('dart2js:noInline')
  static Messages getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Messages>(create);
  static Messages? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get sender => $_getN(0);
  @$pb.TagNumber(1)
  set sender($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSender() => $_has(0);
  @$pb.TagNumber(1)
  void clearSender() => clearField(1);
}

class InfoUserRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'InfoUserRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Adress', $pb.PbFieldType.OY, protoName: 'Adress')
    ..hasRequiredFields = false
  ;

  InfoUserRequest._() : super();
  factory InfoUserRequest({
    $core.List<$core.int>? adress,
  }) {
    final _result = create();
    if (adress != null) {
      _result.adress = adress;
    }
    return _result;
  }
  factory InfoUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InfoUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InfoUserRequest clone() => InfoUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InfoUserRequest copyWith(void Function(InfoUserRequest) updates) => super.copyWith((message) => updates(message as InfoUserRequest)) as InfoUserRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InfoUserRequest create() => InfoUserRequest._();
  InfoUserRequest createEmptyInstance() => create();
  static $pb.PbList<InfoUserRequest> createRepeated() => $pb.PbList<InfoUserRequest>();
  @$core.pragma('dart2js:noInline')
  static InfoUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InfoUserRequest>(create);
  static InfoUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get adress => $_getN(0);
  @$pb.TagNumber(1)
  set adress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAdress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAdress() => clearField(1);
}

class InfoMarketRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'InfoMarketRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Adress', $pb.PbFieldType.OY, protoName: 'Adress')
    ..hasRequiredFields = false
  ;

  InfoMarketRequest._() : super();
  factory InfoMarketRequest({
    $core.List<$core.int>? adress,
  }) {
    final _result = create();
    if (adress != null) {
      _result.adress = adress;
    }
    return _result;
  }
  factory InfoMarketRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InfoMarketRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InfoMarketRequest clone() => InfoMarketRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InfoMarketRequest copyWith(void Function(InfoMarketRequest) updates) => super.copyWith((message) => updates(message as InfoMarketRequest)) as InfoMarketRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InfoMarketRequest create() => InfoMarketRequest._();
  InfoMarketRequest createEmptyInstance() => create();
  static $pb.PbList<InfoMarketRequest> createRepeated() => $pb.PbList<InfoMarketRequest>();
  @$core.pragma('dart2js:noInline')
  static InfoMarketRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InfoMarketRequest>(create);
  static InfoMarketRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get adress => $_getN(0);
  @$pb.TagNumber(1)
  set adress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAdress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAdress() => clearField(1);
}

class InfoFindRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'InfoFindRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'info')
    ..hasRequiredFields = false
  ;

  InfoFindRequest._() : super();
  factory InfoFindRequest({
    $core.String? info,
  }) {
    final _result = create();
    if (info != null) {
      _result.info = info;
    }
    return _result;
  }
  factory InfoFindRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InfoFindRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InfoFindRequest clone() => InfoFindRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InfoFindRequest copyWith(void Function(InfoFindRequest) updates) => super.copyWith((message) => updates(message as InfoFindRequest)) as InfoFindRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InfoFindRequest create() => InfoFindRequest._();
  InfoFindRequest createEmptyInstance() => create();
  static $pb.PbList<InfoFindRequest> createRepeated() => $pb.PbList<InfoFindRequest>();
  @$core.pragma('dart2js:noInline')
  static InfoFindRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InfoFindRequest>(create);
  static InfoFindRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get info => $_getSZ(0);
  @$pb.TagNumber(1)
  set info($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearInfo() => clearField(1);
}

class InfoUserResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'InfoUserResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PublicName', protoName: 'PublicName')
    ..a<$fixnum.Int64>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Balance', $pb.PbFieldType.OU6, protoName: 'Balance', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mesKey', $pb.PbFieldType.OY, protoName: 'mesKey')
    ..hasRequiredFields = false
  ;

  InfoUserResponse._() : super();
  factory InfoUserResponse({
    $core.String? publicName,
    $fixnum.Int64? balance,
    $core.List<$core.int>? mesKey,
  }) {
    final _result = create();
    if (publicName != null) {
      _result.publicName = publicName;
    }
    if (balance != null) {
      _result.balance = balance;
    }
    if (mesKey != null) {
      _result.mesKey = mesKey;
    }
    return _result;
  }
  factory InfoUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InfoUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InfoUserResponse clone() => InfoUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InfoUserResponse copyWith(void Function(InfoUserResponse) updates) => super.copyWith((message) => updates(message as InfoUserResponse)) as InfoUserResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InfoUserResponse create() => InfoUserResponse._();
  InfoUserResponse createEmptyInstance() => create();
  static $pb.PbList<InfoUserResponse> createRepeated() => $pb.PbList<InfoUserResponse>();
  @$core.pragma('dart2js:noInline')
  static InfoUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InfoUserResponse>(create);
  static InfoUserResponse? _defaultInstance;

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

  @$pb.TagNumber(3)
  $core.List<$core.int> get mesKey => $_getN(2);
  @$pb.TagNumber(3)
  set mesKey($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMesKey() => $_has(2);
  @$pb.TagNumber(3)
  void clearMesKey() => clearField(3);
}

class InfoMarketResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'InfoMarketResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'MesssageKey', $pb.PbFieldType.OY, protoName: 'MesssageKey')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Name', protoName: 'Name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Img', protoName: 'Img')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Descr', protoName: 'Descr')
    ..a<$fixnum.Int64>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'OpCount', $pb.PbFieldType.OU6, protoName: 'OpCount', defaultOrMaker: $fixnum.Int64.ZERO)
    ..hasRequiredFields = false
  ;

  InfoMarketResponse._() : super();
  factory InfoMarketResponse({
    $core.List<$core.int>? messsageKey,
    $core.String? name,
    $core.String? img,
    $core.String? descr,
    $fixnum.Int64? opCount,
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
    if (opCount != null) {
      _result.opCount = opCount;
    }
    return _result;
  }
  factory InfoMarketResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InfoMarketResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InfoMarketResponse clone() => InfoMarketResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InfoMarketResponse copyWith(void Function(InfoMarketResponse) updates) => super.copyWith((message) => updates(message as InfoMarketResponse)) as InfoMarketResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InfoMarketResponse create() => InfoMarketResponse._();
  InfoMarketResponse createEmptyInstance() => create();
  static $pb.PbList<InfoMarketResponse> createRepeated() => $pb.PbList<InfoMarketResponse>();
  @$core.pragma('dart2js:noInline')
  static InfoMarketResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InfoMarketResponse>(create);
  static InfoMarketResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get messsageKey => $_getN(0);
  @$pb.TagNumber(1)
  set messsageKey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMesssageKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearMesssageKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get img => $_getSZ(2);
  @$pb.TagNumber(3)
  set img($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasImg() => $_has(2);
  @$pb.TagNumber(3)
  void clearImg() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get descr => $_getSZ(3);
  @$pb.TagNumber(4)
  set descr($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDescr() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescr() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get opCount => $_getI64(4);
  @$pb.TagNumber(5)
  set opCount($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOpCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearOpCount() => clearField(5);
}

class InfoFindResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'InfoFindResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'ConcMarkets', $pb.PbFieldType.OY, protoName: 'ConcMarkets')
    ..hasRequiredFields = false
  ;

  InfoFindResponse._() : super();
  factory InfoFindResponse({
    $core.List<$core.int>? concMarkets,
  }) {
    final _result = create();
    if (concMarkets != null) {
      _result.concMarkets = concMarkets;
    }
    return _result;
  }
  factory InfoFindResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InfoFindResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InfoFindResponse clone() => InfoFindResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InfoFindResponse copyWith(void Function(InfoFindResponse) updates) => super.copyWith((message) => updates(message as InfoFindResponse)) as InfoFindResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static InfoFindResponse create() => InfoFindResponse._();
  InfoFindResponse createEmptyInstance() => create();
  static $pb.PbList<InfoFindResponse> createRepeated() => $pb.PbList<InfoFindResponse>();
  @$core.pragma('dart2js:noInline')
  static InfoFindResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InfoFindResponse>(create);
  static InfoFindResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get concMarkets => $_getN(0);
  @$pb.TagNumber(1)
  set concMarkets($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasConcMarkets() => $_has(0);
  @$pb.TagNumber(1)
  void clearConcMarkets() => clearField(1);
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

class UserWithdrawalRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserWithdrawalRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PublicKey', $pb.PbFieldType.OY, protoName: 'PublicKey')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'MarketAdress', $pb.PbFieldType.OY, protoName: 'MarketAdress')
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Amount', $pb.PbFieldType.OU6, protoName: 'Amount', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Sign', $pb.PbFieldType.OY, protoName: 'Sign')
    ..hasRequiredFields = false
  ;

  UserWithdrawalRequest._() : super();
  factory UserWithdrawalRequest({
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
  factory UserWithdrawalRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserWithdrawalRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserWithdrawalRequest clone() => UserWithdrawalRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserWithdrawalRequest copyWith(void Function(UserWithdrawalRequest) updates) => super.copyWith((message) => updates(message as UserWithdrawalRequest)) as UserWithdrawalRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserWithdrawalRequest create() => UserWithdrawalRequest._();
  UserWithdrawalRequest createEmptyInstance() => create();
  static $pb.PbList<UserWithdrawalRequest> createRepeated() => $pb.PbList<UserWithdrawalRequest>();
  @$core.pragma('dart2js:noInline')
  static UserWithdrawalRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserWithdrawalRequest>(create);
  static UserWithdrawalRequest? _defaultInstance;

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

class UserSendMessageRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserSendMessageRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PublicKey', $pb.PbFieldType.OY, protoName: 'PublicKey')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Adress', $pb.PbFieldType.OY, protoName: 'Adress')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Message', protoName: 'Message')
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Sign', $pb.PbFieldType.OY, protoName: 'Sign')
    ..hasRequiredFields = false
  ;

  UserSendMessageRequest._() : super();
  factory UserSendMessageRequest({
    $core.List<$core.int>? publicKey,
    $core.List<$core.int>? adress,
    $core.String? message,
    $core.List<$core.int>? sign,
  }) {
    final _result = create();
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    if (adress != null) {
      _result.adress = adress;
    }
    if (message != null) {
      _result.message = message;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    return _result;
  }
  factory UserSendMessageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserSendMessageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserSendMessageRequest clone() => UserSendMessageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserSendMessageRequest copyWith(void Function(UserSendMessageRequest) updates) => super.copyWith((message) => updates(message as UserSendMessageRequest)) as UserSendMessageRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserSendMessageRequest create() => UserSendMessageRequest._();
  UserSendMessageRequest createEmptyInstance() => create();
  static $pb.PbList<UserSendMessageRequest> createRepeated() => $pb.PbList<UserSendMessageRequest>();
  @$core.pragma('dart2js:noInline')
  static UserSendMessageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserSendMessageRequest>(create);
  static UserSendMessageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get publicKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicKey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get adress => $_getN(1);
  @$pb.TagNumber(2)
  set adress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAdress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAdress() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get sign => $_getN(3);
  @$pb.TagNumber(4)
  set sign($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSign() => $_has(3);
  @$pb.TagNumber(4)
  void clearSign() => clearField(4);
}

class UserGetMessagesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UserGetMessagesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Adress', $pb.PbFieldType.OY, protoName: 'Adress')
    ..hasRequiredFields = false
  ;

  UserGetMessagesRequest._() : super();
  factory UserGetMessagesRequest({
    $core.List<$core.int>? adress,
  }) {
    final _result = create();
    if (adress != null) {
      _result.adress = adress;
    }
    return _result;
  }
  factory UserGetMessagesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserGetMessagesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserGetMessagesRequest clone() => UserGetMessagesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserGetMessagesRequest copyWith(void Function(UserGetMessagesRequest) updates) => super.copyWith((message) => updates(message as UserGetMessagesRequest)) as UserGetMessagesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserGetMessagesRequest create() => UserGetMessagesRequest._();
  UserGetMessagesRequest createEmptyInstance() => create();
  static $pb.PbList<UserGetMessagesRequest> createRepeated() => $pb.PbList<UserGetMessagesRequest>();
  @$core.pragma('dart2js:noInline')
  static UserGetMessagesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserGetMessagesRequest>(create);
  static UserGetMessagesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get adress => $_getN(0);
  @$pb.TagNumber(1)
  set adress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAdress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAdress() => clearField(1);
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

class MarketWithdrawalRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketWithdrawalRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PublicKey', $pb.PbFieldType.OY, protoName: 'PublicKey')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'UserAdress', $pb.PbFieldType.OY, protoName: 'UserAdress')
    ..a<$fixnum.Int64>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Amount', $pb.PbFieldType.OU6, protoName: 'Amount', defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Sign', $pb.PbFieldType.OY, protoName: 'Sign')
    ..hasRequiredFields = false
  ;

  MarketWithdrawalRequest._() : super();
  factory MarketWithdrawalRequest({
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
  factory MarketWithdrawalRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketWithdrawalRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketWithdrawalRequest clone() => MarketWithdrawalRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketWithdrawalRequest copyWith(void Function(MarketWithdrawalRequest) updates) => super.copyWith((message) => updates(message as MarketWithdrawalRequest)) as MarketWithdrawalRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketWithdrawalRequest create() => MarketWithdrawalRequest._();
  MarketWithdrawalRequest createEmptyInstance() => create();
  static $pb.PbList<MarketWithdrawalRequest> createRepeated() => $pb.PbList<MarketWithdrawalRequest>();
  @$core.pragma('dart2js:noInline')
  static MarketWithdrawalRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketWithdrawalRequest>(create);
  static MarketWithdrawalRequest? _defaultInstance;

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

class MarketSendMessageRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketSendMessageRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'PublicKey', $pb.PbFieldType.OY, protoName: 'PublicKey')
    ..a<$core.List<$core.int>>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Adress', $pb.PbFieldType.OY, protoName: 'Adress')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Message', protoName: 'Message')
    ..a<$core.List<$core.int>>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Sign', $pb.PbFieldType.OY, protoName: 'Sign')
    ..hasRequiredFields = false
  ;

  MarketSendMessageRequest._() : super();
  factory MarketSendMessageRequest({
    $core.List<$core.int>? publicKey,
    $core.List<$core.int>? adress,
    $core.String? message,
    $core.List<$core.int>? sign,
  }) {
    final _result = create();
    if (publicKey != null) {
      _result.publicKey = publicKey;
    }
    if (adress != null) {
      _result.adress = adress;
    }
    if (message != null) {
      _result.message = message;
    }
    if (sign != null) {
      _result.sign = sign;
    }
    return _result;
  }
  factory MarketSendMessageRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketSendMessageRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketSendMessageRequest clone() => MarketSendMessageRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketSendMessageRequest copyWith(void Function(MarketSendMessageRequest) updates) => super.copyWith((message) => updates(message as MarketSendMessageRequest)) as MarketSendMessageRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketSendMessageRequest create() => MarketSendMessageRequest._();
  MarketSendMessageRequest createEmptyInstance() => create();
  static $pb.PbList<MarketSendMessageRequest> createRepeated() => $pb.PbList<MarketSendMessageRequest>();
  @$core.pragma('dart2js:noInline')
  static MarketSendMessageRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketSendMessageRequest>(create);
  static MarketSendMessageRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get publicKey => $_getN(0);
  @$pb.TagNumber(1)
  set publicKey($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPublicKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearPublicKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get adress => $_getN(1);
  @$pb.TagNumber(2)
  set adress($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAdress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAdress() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get sign => $_getN(3);
  @$pb.TagNumber(4)
  set sign($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSign() => $_has(3);
  @$pb.TagNumber(4)
  void clearSign() => clearField(4);
}

class MarketGetMessagesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'MarketGetMessagesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'api'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'Adress', $pb.PbFieldType.OY, protoName: 'Adress')
    ..hasRequiredFields = false
  ;

  MarketGetMessagesRequest._() : super();
  factory MarketGetMessagesRequest({
    $core.List<$core.int>? adress,
  }) {
    final _result = create();
    if (adress != null) {
      _result.adress = adress;
    }
    return _result;
  }
  factory MarketGetMessagesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MarketGetMessagesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  MarketGetMessagesRequest clone() => MarketGetMessagesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  MarketGetMessagesRequest copyWith(void Function(MarketGetMessagesRequest) updates) => super.copyWith((message) => updates(message as MarketGetMessagesRequest)) as MarketGetMessagesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MarketGetMessagesRequest create() => MarketGetMessagesRequest._();
  MarketGetMessagesRequest createEmptyInstance() => create();
  static $pb.PbList<MarketGetMessagesRequest> createRepeated() => $pb.PbList<MarketGetMessagesRequest>();
  @$core.pragma('dart2js:noInline')
  static MarketGetMessagesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MarketGetMessagesRequest>(create);
  static MarketGetMessagesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get adress => $_getN(0);
  @$pb.TagNumber(1)
  set adress($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAdress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAdress() => clearField(1);
}

