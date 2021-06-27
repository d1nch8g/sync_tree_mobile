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
  static final _$message = $grpc.ClientMethod<$0.MessageRequest, $0.Response>(
      '/api.SyncTree/Message',
      ($0.MessageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
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
  static final _$userCreateTrade =
      $grpc.ClientMethod<$0.UserTradeRequest, $0.Response>(
          '/api.SyncTree/UserCreateTrade',
          ($0.UserTradeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$userCancelTrade =
      $grpc.ClientMethod<$0.UserCancelTradeRequest, $0.Response>(
          '/api.SyncTree/UserCancelTrade',
          ($0.UserCancelTradeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$userDeposit =
      $grpc.ClientMethod<$0.UserDepositRequest, $0.Response>(
          '/api.SyncTree/UserDeposit',
          ($0.UserDepositRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$userWithdrawal =
      $grpc.ClientMethod<$0.UserWithDrawalRequest, $0.Response>(
          '/api.SyncTree/UserWithdrawal',
          ($0.UserWithDrawalRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$userSearch =
      $grpc.ClientMethod<$0.UserSearchRequest, $0.Markets>(
          '/api.SyncTree/UserSearch',
          ($0.UserSearchRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Markets.fromBuffer(value));
  static final _$marketInfo =
      $grpc.ClientMethod<$0.MarketInfoRequest, $0.MarketInfoResponse>(
          '/api.SyncTree/MarketInfo',
          ($0.MarketInfoRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MarketInfoResponse.fromBuffer(value));
  static final _$marketCraete =
      $grpc.ClientMethod<$0.MarketCreateRequest, $0.Response>(
          '/api.SyncTree/MarketCraete',
          ($0.MarketCreateRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$marketUpdate =
      $grpc.ClientMethod<$0.MarketUpdateRequest, $0.Response>(
          '/api.SyncTree/MarketUpdate',
          ($0.MarketUpdateRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$marketDeposit =
      $grpc.ClientMethod<$0.MarketDepositRequest, $0.Response>(
          '/api.SyncTree/MarketDeposit',
          ($0.MarketDepositRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$marketWithDrawal =
      $grpc.ClientMethod<$0.MarketWithDrawalRequest, $0.Response>(
          '/api.SyncTree/MarketWithDrawal',
          ($0.MarketWithDrawalRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));

  SyncTreeClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Response> message($0.MessageRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$message, request, options: options);
  }

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

  $grpc.ResponseFuture<$0.Response> userCreateTrade($0.UserTradeRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userCreateTrade, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> userCancelTrade(
      $0.UserCancelTradeRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userCancelTrade, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> userDeposit($0.UserDepositRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userDeposit, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> userWithdrawal(
      $0.UserWithDrawalRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userWithdrawal, request, options: options);
  }

  $grpc.ResponseFuture<$0.Markets> userSearch($0.UserSearchRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userSearch, request, options: options);
  }

  $grpc.ResponseFuture<$0.MarketInfoResponse> marketInfo(
      $0.MarketInfoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$marketInfo, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> marketCraete($0.MarketCreateRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$marketCraete, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> marketUpdate($0.MarketUpdateRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$marketUpdate, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> marketDeposit(
      $0.MarketDepositRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$marketDeposit, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> marketWithDrawal(
      $0.MarketWithDrawalRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$marketWithDrawal, request, options: options);
  }
}

abstract class SyncTreeServiceBase extends $grpc.Service {
  $core.String get $name => 'api.SyncTree';

  SyncTreeServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.MessageRequest, $0.Response>(
        'Message',
        message_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MessageRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
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
    $addMethod($grpc.ServiceMethod<$0.UserTradeRequest, $0.Response>(
        'UserCreateTrade',
        userCreateTrade_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserTradeRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserCancelTradeRequest, $0.Response>(
        'UserCancelTrade',
        userCancelTrade_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UserCancelTradeRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserDepositRequest, $0.Response>(
        'UserDeposit',
        userDeposit_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UserDepositRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserWithDrawalRequest, $0.Response>(
        'UserWithdrawal',
        userWithdrawal_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UserWithDrawalRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserSearchRequest, $0.Markets>(
        'UserSearch',
        userSearch_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserSearchRequest.fromBuffer(value),
        ($0.Markets value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MarketInfoRequest, $0.MarketInfoResponse>(
        'MarketInfo',
        marketInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MarketInfoRequest.fromBuffer(value),
        ($0.MarketInfoResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MarketCreateRequest, $0.Response>(
        'MarketCraete',
        marketCraete_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MarketCreateRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MarketUpdateRequest, $0.Response>(
        'MarketUpdate',
        marketUpdate_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MarketUpdateRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MarketDepositRequest, $0.Response>(
        'MarketDeposit',
        marketDeposit_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MarketDepositRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MarketWithDrawalRequest, $0.Response>(
        'MarketWithDrawal',
        marketWithDrawal_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MarketWithDrawalRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
  }

  $async.Future<$0.Response> message_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MessageRequest> request) async {
    return message(call, await request);
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

  $async.Future<$0.Response> userCreateTrade_Pre($grpc.ServiceCall call,
      $async.Future<$0.UserTradeRequest> request) async {
    return userCreateTrade(call, await request);
  }

  $async.Future<$0.Response> userCancelTrade_Pre($grpc.ServiceCall call,
      $async.Future<$0.UserCancelTradeRequest> request) async {
    return userCancelTrade(call, await request);
  }

  $async.Future<$0.Response> userDeposit_Pre($grpc.ServiceCall call,
      $async.Future<$0.UserDepositRequest> request) async {
    return userDeposit(call, await request);
  }

  $async.Future<$0.Response> userWithdrawal_Pre($grpc.ServiceCall call,
      $async.Future<$0.UserWithDrawalRequest> request) async {
    return userWithdrawal(call, await request);
  }

  $async.Future<$0.Markets> userSearch_Pre($grpc.ServiceCall call,
      $async.Future<$0.UserSearchRequest> request) async {
    return userSearch(call, await request);
  }

  $async.Future<$0.MarketInfoResponse> marketInfo_Pre($grpc.ServiceCall call,
      $async.Future<$0.MarketInfoRequest> request) async {
    return marketInfo(call, await request);
  }

  $async.Future<$0.Response> marketCraete_Pre($grpc.ServiceCall call,
      $async.Future<$0.MarketCreateRequest> request) async {
    return marketCraete(call, await request);
  }

  $async.Future<$0.Response> marketUpdate_Pre($grpc.ServiceCall call,
      $async.Future<$0.MarketUpdateRequest> request) async {
    return marketUpdate(call, await request);
  }

  $async.Future<$0.Response> marketDeposit_Pre($grpc.ServiceCall call,
      $async.Future<$0.MarketDepositRequest> request) async {
    return marketDeposit(call, await request);
  }

  $async.Future<$0.Response> marketWithDrawal_Pre($grpc.ServiceCall call,
      $async.Future<$0.MarketWithDrawalRequest> request) async {
    return marketWithDrawal(call, await request);
  }

  $async.Future<$0.Response> message(
      $grpc.ServiceCall call, $0.MessageRequest request);
  $async.Future<$0.Response> userCreate(
      $grpc.ServiceCall call, $0.UserCreateRequest request);
  $async.Future<$0.Response> userUpdate(
      $grpc.ServiceCall call, $0.UserUpdateRequest request);
  $async.Future<$0.Response> userSend(
      $grpc.ServiceCall call, $0.UserSendRequest request);
  $async.Future<$0.UserInfoResponse> userInfo(
      $grpc.ServiceCall call, $0.UserInfoRequest request);
  $async.Future<$0.Response> userCreateTrade(
      $grpc.ServiceCall call, $0.UserTradeRequest request);
  $async.Future<$0.Response> userCancelTrade(
      $grpc.ServiceCall call, $0.UserCancelTradeRequest request);
  $async.Future<$0.Response> userDeposit(
      $grpc.ServiceCall call, $0.UserDepositRequest request);
  $async.Future<$0.Response> userWithdrawal(
      $grpc.ServiceCall call, $0.UserWithDrawalRequest request);
  $async.Future<$0.Markets> userSearch(
      $grpc.ServiceCall call, $0.UserSearchRequest request);
  $async.Future<$0.MarketInfoResponse> marketInfo(
      $grpc.ServiceCall call, $0.MarketInfoRequest request);
  $async.Future<$0.Response> marketCraete(
      $grpc.ServiceCall call, $0.MarketCreateRequest request);
  $async.Future<$0.Response> marketUpdate(
      $grpc.ServiceCall call, $0.MarketUpdateRequest request);
  $async.Future<$0.Response> marketDeposit(
      $grpc.ServiceCall call, $0.MarketDepositRequest request);
  $async.Future<$0.Response> marketWithDrawal(
      $grpc.ServiceCall call, $0.MarketWithDrawalRequest request);
}
