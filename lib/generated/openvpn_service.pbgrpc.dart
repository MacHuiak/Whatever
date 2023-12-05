//
//  Generated code. Do not modify.
//  source: openvpn_service.proto
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

import 'openvpn_service.pb.dart' as $6;

export 'openvpn_service.pb.dart';

@$pb.GrpcServiceName('openvpn.OpenvpnService')
class OpenvpnServiceClient extends $grpc.Client {
  static final _$signClientCert = $grpc.ClientMethod<$6.SignClientCertRequest, $6.SignClientCertResponse>(
      '/openvpn.OpenvpnService/SignClientCert',
      ($6.SignClientCertRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.SignClientCertResponse.fromBuffer(value));
  static final _$getCACertChain = $grpc.ClientMethod<$6.GetCACertChainRequest, $6.GetCACertChainResponse>(
      '/openvpn.OpenvpnService/GetCACertChain',
      ($6.GetCACertChainRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.GetCACertChainResponse.fromBuffer(value));

  OpenvpnServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$6.SignClientCertResponse> signClientCert($6.SignClientCertRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signClientCert, request, options: options);
  }

  $grpc.ResponseFuture<$6.GetCACertChainResponse> getCACertChain($6.GetCACertChainRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCACertChain, request, options: options);
  }
}

@$pb.GrpcServiceName('openvpn.OpenvpnService')
abstract class OpenvpnServiceBase extends $grpc.Service {
  $core.String get $name => 'openvpn.OpenvpnService';

  OpenvpnServiceBase() {
    $addMethod($grpc.ServiceMethod<$6.SignClientCertRequest, $6.SignClientCertResponse>(
        'SignClientCert',
        signClientCert_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.SignClientCertRequest.fromBuffer(value),
        ($6.SignClientCertResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.GetCACertChainRequest, $6.GetCACertChainResponse>(
        'GetCACertChain',
        getCACertChain_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $6.GetCACertChainRequest.fromBuffer(value),
        ($6.GetCACertChainResponse value) => value.writeToBuffer()));
  }

  $async.Future<$6.SignClientCertResponse> signClientCert_Pre($grpc.ServiceCall call, $async.Future<$6.SignClientCertRequest> request) async {
    return signClientCert(call, await request);
  }

  $async.Future<$6.GetCACertChainResponse> getCACertChain_Pre($grpc.ServiceCall call, $async.Future<$6.GetCACertChainRequest> request) async {
    return getCACertChain(call, await request);
  }

  $async.Future<$6.SignClientCertResponse> signClientCert($grpc.ServiceCall call, $6.SignClientCertRequest request);
  $async.Future<$6.GetCACertChainResponse> getCACertChain($grpc.ServiceCall call, $6.GetCACertChainRequest request);
}
