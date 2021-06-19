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
  static final _$userSend = $grpc.ClientMethod<$0.UserSendRequest, $0.Response>(
      '/api.SyncTree/UserSend',
      ($0.UserSendRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$userLook = $grpc.ClientMethod<$0.Adress, $0.UserLookResponse>(
      '/api.SyncTree/UserLook',
      ($0.Adress value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UserLookResponse.fromBuffer(value));
  static final _$marketCraete =
      $grpc.ClientMethod<$0.MarketCraeteRequest, $0.Response>(
          '/api.SyncTree/MarketCraete',
          ($0.MarketCraeteRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$marketOpenTrade =
      $grpc.ClientMethod<$0.MarketTradeRequest, $0.Response>(
          '/api.SyncTree/MarketOpenTrade',
          ($0.MarketTradeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$marketLook =
      $grpc.ClientMethod<$0.Adress, $0.MarketLookResponse>(
          '/api.SyncTree/MarketLook',
          ($0.Adress value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MarketLookResponse.fromBuffer(value));

  SyncTreeClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Response> userCreate($0.UserCreateRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userCreate, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> userSend($0.UserSendRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userSend, request, options: options);
  }

  $grpc.ResponseFuture<$0.UserLookResponse> userLook($0.Adress request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userLook, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> marketCraete($0.MarketCraeteRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$marketCraete, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> marketOpenTrade(
      $0.MarketTradeRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$marketOpenTrade, request, options: options);
  }

  $grpc.ResponseFuture<$0.MarketLookResponse> marketLook($0.Adress request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$marketLook, request, options: options);
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
    $addMethod($grpc.ServiceMethod<$0.UserSendRequest, $0.Response>(
        'UserSend',
        userSend_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserSendRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Adress, $0.UserLookResponse>(
        'UserLook',
        userLook_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Adress.fromBuffer(value),
        ($0.UserLookResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MarketCraeteRequest, $0.Response>(
        'MarketCraete',
        marketCraete_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MarketCraeteRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MarketTradeRequest, $0.Response>(
        'MarketOpenTrade',
        marketOpenTrade_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MarketTradeRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Adress, $0.MarketLookResponse>(
        'MarketLook',
        marketLook_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Adress.fromBuffer(value),
        ($0.MarketLookResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.Response> userCreate_Pre($grpc.ServiceCall call,
      $async.Future<$0.UserCreateRequest> request) async {
    return userCreate(call, await request);
  }

  $async.Future<$0.Response> userSend_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserSendRequest> request) async {
    return userSend(call, await request);
  }

  $async.Future<$0.UserLookResponse> userLook_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Adress> request) async {
    return userLook(call, await request);
  }

  $async.Future<$0.Response> marketCraete_Pre($grpc.ServiceCall call,
      $async.Future<$0.MarketCraeteRequest> request) async {
    return marketCraete(call, await request);
  }

  $async.Future<$0.Response> marketOpenTrade_Pre($grpc.ServiceCall call,
      $async.Future<$0.MarketTradeRequest> request) async {
    return marketOpenTrade(call, await request);
  }

  $async.Future<$0.MarketLookResponse> marketLook_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Adress> request) async {
    return marketLook(call, await request);
  }

  $async.Future<$0.Response> userCreate(
      $grpc.ServiceCall call, $0.UserCreateRequest request);
  $async.Future<$0.Response> userSend(
      $grpc.ServiceCall call, $0.UserSendRequest request);
  $async.Future<$0.UserLookResponse> userLook(
      $grpc.ServiceCall call, $0.Adress request);
  $async.Future<$0.Response> marketCraete(
      $grpc.ServiceCall call, $0.MarketCraeteRequest request);
  $async.Future<$0.Response> marketOpenTrade(
      $grpc.ServiceCall call, $0.MarketTradeRequest request);
  $async.Future<$0.MarketLookResponse> marketLook(
      $grpc.ServiceCall call, $0.Adress request);
}
