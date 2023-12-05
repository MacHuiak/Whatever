//
//  Generated code. Do not modify.
//  source: host_service.proto
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

import 'host.pb.dart' as $4;
import 'host_service.pb.dart' as $5;

export 'host_service.pb.dart';

@$pb.GrpcServiceName('host.HostService')
class HostServiceClient extends $grpc.Client {
  static final _$createHost = $grpc.ClientMethod<$4.Host, $4.Host>(
      '/host.HostService/CreateHost',
      ($4.Host value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.Host.fromBuffer(value));
  static final _$listHosts = $grpc.ClientMethod<$5.ListHostsRequest, $5.ListHostsResponse>(
      '/host.HostService/ListHosts',
      ($5.ListHostsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.ListHostsResponse.fromBuffer(value));

  HostServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$4.Host> createHost($4.Host request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createHost, request, options: options);
  }

  $grpc.ResponseFuture<$5.ListHostsResponse> listHosts($5.ListHostsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listHosts, request, options: options);
  }
}

@$pb.GrpcServiceName('host.HostService')
abstract class HostServiceBase extends $grpc.Service {
  $core.String get $name => 'host.HostService';

  HostServiceBase() {
    $addMethod($grpc.ServiceMethod<$4.Host, $4.Host>(
        'CreateHost',
        createHost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.Host.fromBuffer(value),
        ($4.Host value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.ListHostsRequest, $5.ListHostsResponse>(
        'ListHosts',
        listHosts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.ListHostsRequest.fromBuffer(value),
        ($5.ListHostsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$4.Host> createHost_Pre($grpc.ServiceCall call, $async.Future<$4.Host> request) async {
    return createHost(call, await request);
  }

  $async.Future<$5.ListHostsResponse> listHosts_Pre($grpc.ServiceCall call, $async.Future<$5.ListHostsRequest> request) async {
    return listHosts(call, await request);
  }

  $async.Future<$4.Host> createHost($grpc.ServiceCall call, $4.Host request);
  $async.Future<$5.ListHostsResponse> listHosts($grpc.ServiceCall call, $5.ListHostsRequest request);
}
