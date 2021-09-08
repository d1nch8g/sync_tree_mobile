///
//  Generated code. Do not modify.
//  source: lib/_net/api.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'api.pb.dart' as $0;
export 'api.pb.dart';

class SyncTreeClient extends $grpc.Client {
  static final _$infoUser =
      $grpc.ClientMethod<$0.InfoUserRequest, $0.InfoUserResponse>(
          '/api.SyncTree/InfoUser',
          ($0.InfoUserRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.InfoUserResponse.fromBuffer(value));
  static final _$infoMarket =
      $grpc.ClientMethod<$0.InfoMarketRequest, $0.InfoMarketResponse>(
          '/api.SyncTree/InfoMarket',
          ($0.InfoMarketRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.InfoMarketResponse.fromBuffer(value));
  static final _$infoSearch =
      $grpc.ClientMethod<$0.InfoSearchRequest, $0.InfoSearchResponse>(
          '/api.SyncTree/InfoSearch',
          ($0.InfoSearchRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.InfoSearchResponse.fromBuffer(value));
  static final _$infoHasTrades =
      $grpc.ClientMethod<$0.InfoHasTradesRequest, $0.Response>(
          '/api.SyncTree/InfoHasTrades',
          ($0.InfoHasTradesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$infoMessages =
      $grpc.ClientMethod<$0.InfoMessagesRequest, $0.Messages>(
          '/api.SyncTree/InfoMessages',
          ($0.InfoMessagesRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Messages.fromBuffer(value));
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
  static final _$userDeposit =
      $grpc.ClientMethod<$0.UserDepositRequest, $0.Response>(
          '/api.SyncTree/UserDeposit',
          ($0.UserDepositRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$userWithdrawal =
      $grpc.ClientMethod<$0.UserWithdrawalRequest, $0.Response>(
          '/api.SyncTree/UserWithdrawal',
          ($0.UserWithdrawalRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$userSendMessage =
      $grpc.ClientMethod<$0.UserSendMessageRequest, $0.Response>(
          '/api.SyncTree/UserSendMessage',
          ($0.UserSendMessageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$userBuy = $grpc.ClientMethod<$0.UserBuyRequest, $0.Response>(
      '/api.SyncTree/UserBuy',
      ($0.UserBuyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$userSell = $grpc.ClientMethod<$0.UserSellRequest, $0.Response>(
      '/api.SyncTree/UserSell',
      ($0.UserSellRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$userCancelTrade =
      $grpc.ClientMethod<$0.UserCancelTradeRequest, $0.Response>(
          '/api.SyncTree/UserCancelTrade',
          ($0.UserCancelTradeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
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
  static final _$marketWithdrawal =
      $grpc.ClientMethod<$0.MarketWithdrawalRequest, $0.Response>(
          '/api.SyncTree/MarketWithdrawal',
          ($0.MarketWithdrawalRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$marketSendMessage =
      $grpc.ClientMethod<$0.MarketSendMessageRequest, $0.Response>(
          '/api.SyncTree/MarketSendMessage',
          ($0.MarketSendMessageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));

  SyncTreeClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.InfoUserResponse> infoUser($0.InfoUserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$infoUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.InfoMarketResponse> infoMarket(
      $0.InfoMarketRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$infoMarket, request, options: options);
  }

  $grpc.ResponseFuture<$0.InfoSearchResponse> infoSearch(
      $0.InfoSearchRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$infoSearch, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> infoHasTrades(
      $0.InfoHasTradesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$infoHasTrades, request, options: options);
  }

  $grpc.ResponseFuture<$0.Messages> infoMessages($0.InfoMessagesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$infoMessages, request, options: options);
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

  $grpc.ResponseFuture<$0.Response> userDeposit($0.UserDepositRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userDeposit, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> userWithdrawal(
      $0.UserWithdrawalRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userWithdrawal, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> userSendMessage(
      $0.UserSendMessageRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userSendMessage, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> userBuy($0.UserBuyRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userBuy, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> userSell($0.UserSellRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userSell, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> userCancelTrade(
      $0.UserCancelTradeRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$userCancelTrade, request, options: options);
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

  $grpc.ResponseFuture<$0.Response> marketWithdrawal(
      $0.MarketWithdrawalRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$marketWithdrawal, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> marketSendMessage(
      $0.MarketSendMessageRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$marketSendMessage, request, options: options);
  }
}

abstract class SyncTreeServiceBase extends $grpc.Service {
  $core.String get $name => 'api.SyncTree';

  SyncTreeServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.InfoUserRequest, $0.InfoUserResponse>(
        'InfoUser',
        infoUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.InfoUserRequest.fromBuffer(value),
        ($0.InfoUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.InfoMarketRequest, $0.InfoMarketResponse>(
        'InfoMarket',
        infoMarket_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.InfoMarketRequest.fromBuffer(value),
        ($0.InfoMarketResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.InfoSearchRequest, $0.InfoSearchResponse>(
        'InfoSearch',
        infoSearch_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.InfoSearchRequest.fromBuffer(value),
        ($0.InfoSearchResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.InfoHasTradesRequest, $0.Response>(
        'InfoHasTrades',
        infoHasTrades_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.InfoHasTradesRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.InfoMessagesRequest, $0.Messages>(
        'InfoMessages',
        infoMessages_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.InfoMessagesRequest.fromBuffer(value),
        ($0.Messages value) => value.writeToBuffer()));
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
    $addMethod($grpc.ServiceMethod<$0.UserDepositRequest, $0.Response>(
        'UserDeposit',
        userDeposit_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UserDepositRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserWithdrawalRequest, $0.Response>(
        'UserWithdrawal',
        userWithdrawal_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UserWithdrawalRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserSendMessageRequest, $0.Response>(
        'UserSendMessage',
        userSendMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UserSendMessageRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserBuyRequest, $0.Response>(
        'UserBuy',
        userBuy_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserBuyRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserSellRequest, $0.Response>(
        'UserSell',
        userSell_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserSellRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserCancelTradeRequest, $0.Response>(
        'UserCancelTrade',
        userCancelTrade_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UserCancelTradeRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
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
    $addMethod($grpc.ServiceMethod<$0.MarketWithdrawalRequest, $0.Response>(
        'MarketWithdrawal',
        marketWithdrawal_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MarketWithdrawalRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MarketSendMessageRequest, $0.Response>(
        'MarketSendMessage',
        marketSendMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MarketSendMessageRequest.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
  }

  $async.Future<$0.InfoUserResponse> infoUser_Pre(
      $grpc.ServiceCall call, $async.Future<$0.InfoUserRequest> request) async {
    return infoUser(call, await request);
  }

  $async.Future<$0.InfoMarketResponse> infoMarket_Pre($grpc.ServiceCall call,
      $async.Future<$0.InfoMarketRequest> request) async {
    return infoMarket(call, await request);
  }

  $async.Future<$0.InfoSearchResponse> infoSearch_Pre($grpc.ServiceCall call,
      $async.Future<$0.InfoSearchRequest> request) async {
    return infoSearch(call, await request);
  }

  $async.Future<$0.Response> infoHasTrades_Pre($grpc.ServiceCall call,
      $async.Future<$0.InfoHasTradesRequest> request) async {
    return infoHasTrades(call, await request);
  }

  $async.Future<$0.Messages> infoMessages_Pre($grpc.ServiceCall call,
      $async.Future<$0.InfoMessagesRequest> request) async {
    return infoMessages(call, await request);
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

  $async.Future<$0.Response> userDeposit_Pre($grpc.ServiceCall call,
      $async.Future<$0.UserDepositRequest> request) async {
    return userDeposit(call, await request);
  }

  $async.Future<$0.Response> userWithdrawal_Pre($grpc.ServiceCall call,
      $async.Future<$0.UserWithdrawalRequest> request) async {
    return userWithdrawal(call, await request);
  }

  $async.Future<$0.Response> userSendMessage_Pre($grpc.ServiceCall call,
      $async.Future<$0.UserSendMessageRequest> request) async {
    return userSendMessage(call, await request);
  }

  $async.Future<$0.Response> userBuy_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserBuyRequest> request) async {
    return userBuy(call, await request);
  }

  $async.Future<$0.Response> userSell_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserSellRequest> request) async {
    return userSell(call, await request);
  }

  $async.Future<$0.Response> userCancelTrade_Pre($grpc.ServiceCall call,
      $async.Future<$0.UserCancelTradeRequest> request) async {
    return userCancelTrade(call, await request);
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

  $async.Future<$0.Response> marketWithdrawal_Pre($grpc.ServiceCall call,
      $async.Future<$0.MarketWithdrawalRequest> request) async {
    return marketWithdrawal(call, await request);
  }

  $async.Future<$0.Response> marketSendMessage_Pre($grpc.ServiceCall call,
      $async.Future<$0.MarketSendMessageRequest> request) async {
    return marketSendMessage(call, await request);
  }

  $async.Future<$0.InfoUserResponse> infoUser(
      $grpc.ServiceCall call, $0.InfoUserRequest request);
  $async.Future<$0.InfoMarketResponse> infoMarket(
      $grpc.ServiceCall call, $0.InfoMarketRequest request);
  $async.Future<$0.InfoSearchResponse> infoSearch(
      $grpc.ServiceCall call, $0.InfoSearchRequest request);
  $async.Future<$0.Response> infoHasTrades(
      $grpc.ServiceCall call, $0.InfoHasTradesRequest request);
  $async.Future<$0.Messages> infoMessages(
      $grpc.ServiceCall call, $0.InfoMessagesRequest request);
  $async.Future<$0.Response> userCreate(
      $grpc.ServiceCall call, $0.UserCreateRequest request);
  $async.Future<$0.Response> userUpdate(
      $grpc.ServiceCall call, $0.UserUpdateRequest request);
  $async.Future<$0.Response> userSend(
      $grpc.ServiceCall call, $0.UserSendRequest request);
  $async.Future<$0.Response> userDeposit(
      $grpc.ServiceCall call, $0.UserDepositRequest request);
  $async.Future<$0.Response> userWithdrawal(
      $grpc.ServiceCall call, $0.UserWithdrawalRequest request);
  $async.Future<$0.Response> userSendMessage(
      $grpc.ServiceCall call, $0.UserSendMessageRequest request);
  $async.Future<$0.Response> userBuy(
      $grpc.ServiceCall call, $0.UserBuyRequest request);
  $async.Future<$0.Response> userSell(
      $grpc.ServiceCall call, $0.UserSellRequest request);
  $async.Future<$0.Response> userCancelTrade(
      $grpc.ServiceCall call, $0.UserCancelTradeRequest request);
  $async.Future<$0.Response> marketCraete(
      $grpc.ServiceCall call, $0.MarketCreateRequest request);
  $async.Future<$0.Response> marketUpdate(
      $grpc.ServiceCall call, $0.MarketUpdateRequest request);
  $async.Future<$0.Response> marketDeposit(
      $grpc.ServiceCall call, $0.MarketDepositRequest request);
  $async.Future<$0.Response> marketWithdrawal(
      $grpc.ServiceCall call, $0.MarketWithdrawalRequest request);
  $async.Future<$0.Response> marketSendMessage(
      $grpc.ServiceCall call, $0.MarketSendMessageRequest request);
}
