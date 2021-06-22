///
//  Generated code. Do not modify.
//  source: lib/api/api.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'api.pb.dart' as $0;
export 'api.pb.dart';

class SyncTreeClient extends $grpc.Client {
  static final _$userCreate =
      $grpc.ClientMethod<$0.UserCreateRequest, $0.Response>(
          '/api.SyncTree/UserCreate',
          ($0.UserCreateRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$userUpdate =
      $grpc.ClientMethod<$0.UserUpdateRequest, $0.Response>(
          '/api.SyncTree/UserUpdate',
          ($0.UserUpdateRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$userSend = $grpc.ClientMethod<$0.UserSendRequest, $0.Response>(
      '/api.SyncTree/UserSend',
      ($0.UserSendRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$userInfo =
      $grpc.ClientMethod<$0.UserInfoRequest, $0.UserInfoResponse>(
          '/api.SyncTree/UserInfo',
          ($0.UserInfoRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UserInfoResponse.fromBuffer(value));

  SyncTreeClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Response> userCreate($0.UserCreateRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userCreate, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> userUpdate($0.UserUpdateRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userUpdate, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> userSend($0.UserSendRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userSend, request, options: options);
  }

  $grpc.ResponseFuture<$0.UserInfoResponse> userInfo($0.UserInfoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userInfo, request, options: options);
  }
}

abstract class SyncTreeServiceBase extends $grpc.Service {
  $core.String get $name => 'api.SyncTree';

  SyncTreeServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.UserCreateRequest, $0.Response>(
        'UserCreate',
        userCreate_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserCreateRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserUpdateRequest, $0.Response>(
        'UserUpdate',
        userUpdate_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserUpdateRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserSendRequest, $0.Response>(
        'UserSend',
        userSend_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserSendRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserInfoRequest, $0.UserInfoResponse>(
        'UserInfo',
        userInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserInfoRequest.fromBuffer(value),
        ($0.UserInfoResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.Response> userCreate_Pre($grpc.ServiceCall call,
      $async.Future<$0.UserCreateRequest> request) async {
    return userCreate(call, await request);
  }

  $async.Future<$0.Response> userUpdate_Pre($grpc.ServiceCall call,
      $async.Future<$0.UserUpdateRequest> request) async {
    return userUpdate(call, await request);
  }

  $async.Future<$0.Response> userSend_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserSendRequest> request) async {
    return userSend(call, await request);
  }

  $async.Future<$0.UserInfoResponse> userInfo_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserInfoRequest> request) async {
    return userInfo(call, await request);
  }

  $async.Future<$0.Response> userCreate(
      $grpc.ServiceCall call, $0.UserCreateRequest request);
  $async.Future<$0.Response> userUpdate(
      $grpc.ServiceCall call, $0.UserUpdateRequest request);
  $async.Future<$0.Response> userSend(
      $grpc.ServiceCall call, $0.UserSendRequest request);
  $async.Future<$0.UserInfoResponse> userInfo(
      $grpc.ServiceCall call, $0.UserInfoRequest request);
}
