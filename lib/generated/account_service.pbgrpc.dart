//
//  Generated code. Do not modify.
//  source: account_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'account.pb.dart' as $1;
import 'account_service.pb.dart' as $0;
import 'empty.pb.dart' as $2;

export 'account_service.pb.dart';

@$pb.GrpcServiceName('account.AccountService')
class AccountServiceClient extends $grpc.Client {
  static final _$createAccount = $grpc.ClientMethod<$0.CreateAccountRequest, $1.Account>(
      '/account.AccountService/CreateAccount',
      ($0.CreateAccountRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Account.fromBuffer(value));
  static final _$banAccount = $grpc.ClientMethod<$0.BanAccountRequest, $2.Empty>(
      '/account.AccountService/BanAccount',
      ($0.BanAccountRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.Empty.fromBuffer(value));

  AccountServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$1.Account> createAccount($0.CreateAccountRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createAccount, request, options: options);
  }

  $grpc.ResponseFuture<$2.Empty> banAccount($0.BanAccountRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$banAccount, request, options: options);
  }
}

@$pb.GrpcServiceName('account.AccountService')
abstract class AccountServiceBase extends $grpc.Service {
  $core.String get $name => 'account.AccountService';

  AccountServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateAccountRequest, $1.Account>(
        'CreateAccount',
        createAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateAccountRequest.fromBuffer(value),
        ($1.Account value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.BanAccountRequest, $2.Empty>(
        'BanAccount',
        banAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.BanAccountRequest.fromBuffer(value),
        ($2.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$1.Account> createAccount_Pre($grpc.ServiceCall call, $async.Future<$0.CreateAccountRequest> request) async {
    return createAccount(call, await request);
  }

  $async.Future<$2.Empty> banAccount_Pre($grpc.ServiceCall call, $async.Future<$0.BanAccountRequest> request) async {
    return banAccount(call, await request);
  }

  $async.Future<$1.Account> createAccount($grpc.ServiceCall call, $0.CreateAccountRequest request);
  $async.Future<$2.Empty> banAccount($grpc.ServiceCall call, $0.BanAccountRequest request);
}
