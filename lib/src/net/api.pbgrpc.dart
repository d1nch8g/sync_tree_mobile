///
//  Generated code. Do not modify.
//  source: lib/src/net/api.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'api.pb.dart' as $0;
export 'api.pb.dart';

class InfoClient extends $grpc.Client {
  static final _$user = $grpc.ClientMethod<$0.InfIn_Adress, $0.InfOut_User>(
      '/api.Info/User',
      ($0.InfIn_Adress value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.InfOut_User.fromBuffer(value));
  static final _$hasTrades =
      $grpc.ClientMethod<$0.InfIn_UserMarketAdresses, $0.InfOut_HasTrades>(
          '/api.Info/HasTrades',
          ($0.InfIn_UserMarketAdresses value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.InfOut_HasTrades.fromBuffer(value));
  static final _$market =
      $grpc.ClientMethod<$0.InfIn_Adress, $0.InfOut_MarketInfo>(
          '/api.Info/Market',
          ($0.InfIn_Adress value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.InfOut_MarketInfo.fromBuffer(value));
  static final _$search =
      $grpc.ClientMethod<$0.InfIn_SearchText, $0.InfOut_Adresses>(
          '/api.Info/Search',
          ($0.InfIn_SearchText value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.InfOut_Adresses.fromBuffer(value));
  static final _$messages =
      $grpc.ClientMethod<$0.InfIn_UserMarketAdresses, $0.InfOut_Messages>(
          '/api.Info/Messages',
          ($0.InfIn_UserMarketAdresses value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.InfOut_Messages.fromBuffer(value));

  InfoClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.InfOut_User> user($0.InfIn_Adress request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$user, request, options: options);
  }

  $grpc.ResponseFuture<$0.InfOut_HasTrades> hasTrades(
      $0.InfIn_UserMarketAdresses request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$hasTrades, request, options: options);
  }

  $grpc.ResponseFuture<$0.InfOut_MarketInfo> market($0.InfIn_Adress request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$market, request, options: options);
  }

  $grpc.ResponseFuture<$0.InfOut_Adresses> search($0.InfIn_SearchText request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$search, request, options: options);
  }

  $grpc.ResponseFuture<$0.InfOut_Messages> messages(
      $0.InfIn_UserMarketAdresses request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$messages, request, options: options);
  }
}

abstract class InfoServiceBase extends $grpc.Service {
  $core.String get $name => 'api.Info';

  InfoServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.InfIn_Adress, $0.InfOut_User>(
        'User',
        user_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.InfIn_Adress.fromBuffer(value),
        ($0.InfOut_User value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.InfIn_UserMarketAdresses, $0.InfOut_HasTrades>(
            'HasTrades',
            hasTrades_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.InfIn_UserMarketAdresses.fromBuffer(value),
            ($0.InfOut_HasTrades value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.InfIn_Adress, $0.InfOut_MarketInfo>(
        'Market',
        market_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.InfIn_Adress.fromBuffer(value),
        ($0.InfOut_MarketInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.InfIn_SearchText, $0.InfOut_Adresses>(
        'Search',
        search_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.InfIn_SearchText.fromBuffer(value),
        ($0.InfOut_Adresses value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.InfIn_UserMarketAdresses, $0.InfOut_Messages>(
            'Messages',
            messages_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.InfIn_UserMarketAdresses.fromBuffer(value),
            ($0.InfOut_Messages value) => value.writeToBuffer()));
  }

  $async.Future<$0.InfOut_User> user_Pre(
      $grpc.ServiceCall call, $async.Future<$0.InfIn_Adress> request) async {
    return user(call, await request);
  }

  $async.Future<$0.InfOut_HasTrades> hasTrades_Pre($grpc.ServiceCall call,
      $async.Future<$0.InfIn_UserMarketAdresses> request) async {
    return hasTrades(call, await request);
  }

  $async.Future<$0.InfOut_MarketInfo> market_Pre(
      $grpc.ServiceCall call, $async.Future<$0.InfIn_Adress> request) async {
    return market(call, await request);
  }

  $async.Future<$0.InfOut_Adresses> search_Pre($grpc.ServiceCall call,
      $async.Future<$0.InfIn_SearchText> request) async {
    return search(call, await request);
  }

  $async.Future<$0.InfOut_Messages> messages_Pre($grpc.ServiceCall call,
      $async.Future<$0.InfIn_UserMarketAdresses> request) async {
    return messages(call, await request);
  }

  $async.Future<$0.InfOut_User> user(
      $grpc.ServiceCall call, $0.InfIn_Adress request);
  $async.Future<$0.InfOut_HasTrades> hasTrades(
      $grpc.ServiceCall call, $0.InfIn_UserMarketAdresses request);
  $async.Future<$0.InfOut_MarketInfo> market(
      $grpc.ServiceCall call, $0.InfIn_Adress request);
  $async.Future<$0.InfOut_Adresses> search(
      $grpc.ServiceCall call, $0.InfIn_SearchText request);
  $async.Future<$0.InfOut_Messages> messages(
      $grpc.ServiceCall call, $0.InfIn_UserMarketAdresses request);
}

class UserClient extends $grpc.Client {
  static final _$create =
      $grpc.ClientMethod<$0.UserRequests_Create, $0.Response>(
          '/api.User/Create',
          ($0.UserRequests_Create value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$update =
      $grpc.ClientMethod<$0.UserRequests_Update, $0.Response>(
          '/api.User/Update',
          ($0.UserRequests_Update value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$send = $grpc.ClientMethod<$0.UserRequests_Send, $0.Response>(
      '/api.User/Send',
      ($0.UserRequests_Send value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$message =
      $grpc.ClientMethod<$0.UserRequests_Message, $0.Response>(
          '/api.User/Message',
          ($0.UserRequests_Message value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$buy = $grpc.ClientMethod<$0.UserRequests_Buy, $0.Response>(
      '/api.User/Buy',
      ($0.UserRequests_Buy value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$sell = $grpc.ClientMethod<$0.UserRequests_Sell, $0.Response>(
      '/api.User/Sell',
      ($0.UserRequests_Sell value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$cancelTrade =
      $grpc.ClientMethod<$0.UserRequests_CancelTrade, $0.Response>(
          '/api.User/CancelTrade',
          ($0.UserRequests_CancelTrade value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));

  UserClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Response> create($0.UserRequests_Create request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$create, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> update($0.UserRequests_Update request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$update, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> send($0.UserRequests_Send request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$send, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> message($0.UserRequests_Message request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$message, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> buy($0.UserRequests_Buy request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$buy, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> sell($0.UserRequests_Sell request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sell, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> cancelTrade(
      $0.UserRequests_CancelTrade request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$cancelTrade, request, options: options);
  }
}

abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'api.User';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.UserRequests_Create, $0.Response>(
        'Create',
        create_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UserRequests_Create.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserRequests_Update, $0.Response>(
        'Update',
        update_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UserRequests_Update.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserRequests_Send, $0.Response>(
        'Send',
        send_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserRequests_Send.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserRequests_Message, $0.Response>(
        'Message',
        message_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UserRequests_Message.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserRequests_Buy, $0.Response>(
        'Buy',
        buy_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserRequests_Buy.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserRequests_Sell, $0.Response>(
        'Sell',
        sell_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserRequests_Sell.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserRequests_CancelTrade, $0.Response>(
        'CancelTrade',
        cancelTrade_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UserRequests_CancelTrade.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
  }

  $async.Future<$0.Response> create_Pre($grpc.ServiceCall call,
      $async.Future<$0.UserRequests_Create> request) async {
    return create(call, await request);
  }

  $async.Future<$0.Response> update_Pre($grpc.ServiceCall call,
      $async.Future<$0.UserRequests_Update> request) async {
    return update(call, await request);
  }

  $async.Future<$0.Response> send_Pre($grpc.ServiceCall call,
      $async.Future<$0.UserRequests_Send> request) async {
    return send(call, await request);
  }

  $async.Future<$0.Response> message_Pre($grpc.ServiceCall call,
      $async.Future<$0.UserRequests_Message> request) async {
    return message(call, await request);
  }

  $async.Future<$0.Response> buy_Pre($grpc.ServiceCall call,
      $async.Future<$0.UserRequests_Buy> request) async {
    return buy(call, await request);
  }

  $async.Future<$0.Response> sell_Pre($grpc.ServiceCall call,
      $async.Future<$0.UserRequests_Sell> request) async {
    return sell(call, await request);
  }

  $async.Future<$0.Response> cancelTrade_Pre($grpc.ServiceCall call,
      $async.Future<$0.UserRequests_CancelTrade> request) async {
    return cancelTrade(call, await request);
  }

  $async.Future<$0.Response> create(
      $grpc.ServiceCall call, $0.UserRequests_Create request);
  $async.Future<$0.Response> update(
      $grpc.ServiceCall call, $0.UserRequests_Update request);
  $async.Future<$0.Response> send(
      $grpc.ServiceCall call, $0.UserRequests_Send request);
  $async.Future<$0.Response> message(
      $grpc.ServiceCall call, $0.UserRequests_Message request);
  $async.Future<$0.Response> buy(
      $grpc.ServiceCall call, $0.UserRequests_Buy request);
  $async.Future<$0.Response> sell(
      $grpc.ServiceCall call, $0.UserRequests_Sell request);
  $async.Future<$0.Response> cancelTrade(
      $grpc.ServiceCall call, $0.UserRequests_CancelTrade request);
}

class MarketClient extends $grpc.Client {
  static final _$spawn =
      $grpc.ClientMethod<$0.MarketRequests_Create, $0.Response>(
          '/api.Market/Spawn',
          ($0.MarketRequests_Create value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$refresh =
      $grpc.ClientMethod<$0.MarketRequests_Update, $0.Response>(
          '/api.Market/Refresh',
          ($0.MarketRequests_Update value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$deposit =
      $grpc.ClientMethod<$0.MarketRequests_Deposit, $0.Response>(
          '/api.Market/Deposit',
          ($0.MarketRequests_Deposit value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$withdrawal =
      $grpc.ClientMethod<$0.MarketRequests_Withdrawal, $0.Response>(
          '/api.Market/Withdrawal',
          ($0.MarketRequests_Withdrawal value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));
  static final _$reply =
      $grpc.ClientMethod<$0.MarketRequests_Reply, $0.Response>(
          '/api.Market/Reply',
          ($0.MarketRequests_Reply value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Response.fromBuffer(value));

  MarketClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Response> spawn($0.MarketRequests_Create request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$spawn, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> refresh($0.MarketRequests_Update request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$refresh, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> deposit($0.MarketRequests_Deposit request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deposit, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> withdrawal(
      $0.MarketRequests_Withdrawal request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$withdrawal, request, options: options);
  }

  $grpc.ResponseFuture<$0.Response> reply($0.MarketRequests_Reply request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$reply, request, options: options);
  }
}

abstract class MarketServiceBase extends $grpc.Service {
  $core.String get $name => 'api.Market';

  MarketServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.MarketRequests_Create, $0.Response>(
        'Spawn',
        spawn_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MarketRequests_Create.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MarketRequests_Update, $0.Response>(
        'Refresh',
        refresh_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MarketRequests_Update.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MarketRequests_Deposit, $0.Response>(
        'Deposit',
        deposit_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MarketRequests_Deposit.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MarketRequests_Withdrawal, $0.Response>(
        'Withdrawal',
        withdrawal_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MarketRequests_Withdrawal.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MarketRequests_Reply, $0.Response>(
        'Reply',
        reply_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.MarketRequests_Reply.fromBuffer(value),
        ($0.Response value) => value.writeToBuffer()));
  }

  $async.Future<$0.Response> spawn_Pre($grpc.ServiceCall call,
      $async.Future<$0.MarketRequests_Create> request) async {
    return spawn(call, await request);
  }

  $async.Future<$0.Response> refresh_Pre($grpc.ServiceCall call,
      $async.Future<$0.MarketRequests_Update> request) async {
    return refresh(call, await request);
  }

  $async.Future<$0.Response> deposit_Pre($grpc.ServiceCall call,
      $async.Future<$0.MarketRequests_Deposit> request) async {
    return deposit(call, await request);
  }

  $async.Future<$0.Response> withdrawal_Pre($grpc.ServiceCall call,
      $async.Future<$0.MarketRequests_Withdrawal> request) async {
    return withdrawal(call, await request);
  }

  $async.Future<$0.Response> reply_Pre($grpc.ServiceCall call,
      $async.Future<$0.MarketRequests_Reply> request) async {
    return reply(call, await request);
  }

  $async.Future<$0.Response> spawn(
      $grpc.ServiceCall call, $0.MarketRequests_Create request);
  $async.Future<$0.Response> refresh(
      $grpc.ServiceCall call, $0.MarketRequests_Update request);
  $async.Future<$0.Response> deposit(
      $grpc.ServiceCall call, $0.MarketRequests_Deposit request);
  $async.Future<$0.Response> withdrawal(
      $grpc.ServiceCall call, $0.MarketRequests_Withdrawal request);
  $async.Future<$0.Response> reply(
      $grpc.ServiceCall call, $0.MarketRequests_Reply request);
}
