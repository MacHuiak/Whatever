//
//  Generated code. Do not modify.
//  source: openvpn_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SignClientCertRequest extends $pb.GeneratedMessage {
  factory SignClientCertRequest() => create();
  SignClientCertRequest._() : super();
  factory SignClientCertRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignClientCertRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SignClientCertRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'openvpn'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'csr', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignClientCertRequest clone() => SignClientCertRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignClientCertRequest copyWith(void Function(SignClientCertRequest) updates) => super.copyWith((message) => updates(message as SignClientCertRequest)) as SignClientCertRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignClientCertRequest create() => SignClientCertRequest._();
  SignClientCertRequest createEmptyInstance() => create();
  static $pb.PbList<SignClientCertRequest> createRepeated() => $pb.PbList<SignClientCertRequest>();
  @$core.pragma('dart2js:noInline')
  static SignClientCertRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignClientCertRequest>(create);
  static SignClientCertRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get csr => $_getN(0);
  @$pb.TagNumber(1)
  set csr($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCsr() => $_has(0);
  @$pb.TagNumber(1)
  void clearCsr() => clearField(1);
}

class SignClientCertResponse extends $pb.GeneratedMessage {
  factory SignClientCertResponse() => create();
  SignClientCertResponse._() : super();
  factory SignClientCertResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SignClientCertResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SignClientCertResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'openvpn'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'cert', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SignClientCertResponse clone() => SignClientCertResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SignClientCertResponse copyWith(void Function(SignClientCertResponse) updates) => super.copyWith((message) => updates(message as SignClientCertResponse)) as SignClientCertResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SignClientCertResponse create() => SignClientCertResponse._();
  SignClientCertResponse createEmptyInstance() => create();
  static $pb.PbList<SignClientCertResponse> createRepeated() => $pb.PbList<SignClientCertResponse>();
  @$core.pragma('dart2js:noInline')
  static SignClientCertResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SignClientCertResponse>(create);
  static SignClientCertResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cert => $_getN(0);
  @$pb.TagNumber(1)
  set cert($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCert() => $_has(0);
  @$pb.TagNumber(1)
  void clearCert() => clearField(1);
}

class GetCACertChainRequest extends $pb.GeneratedMessage {
  factory GetCACertChainRequest() => create();
  GetCACertChainRequest._() : super();
  factory GetCACertChainRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCACertChainRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCACertChainRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'openvpn'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCACertChainRequest clone() => GetCACertChainRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCACertChainRequest copyWith(void Function(GetCACertChainRequest) updates) => super.copyWith((message) => updates(message as GetCACertChainRequest)) as GetCACertChainRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCACertChainRequest create() => GetCACertChainRequest._();
  GetCACertChainRequest createEmptyInstance() => create();
  static $pb.PbList<GetCACertChainRequest> createRepeated() => $pb.PbList<GetCACertChainRequest>();
  @$core.pragma('dart2js:noInline')
  static GetCACertChainRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCACertChainRequest>(create);
  static GetCACertChainRequest? _defaultInstance;
}

class GetCACertChainResponse extends $pb.GeneratedMessage {
  factory GetCACertChainResponse() => create();
  GetCACertChainResponse._() : super();
  factory GetCACertChainResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCACertChainResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCACertChainResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'openvpn'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'chain', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCACertChainResponse clone() => GetCACertChainResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCACertChainResponse copyWith(void Function(GetCACertChainResponse) updates) => super.copyWith((message) => updates(message as GetCACertChainResponse)) as GetCACertChainResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCACertChainResponse create() => GetCACertChainResponse._();
  GetCACertChainResponse createEmptyInstance() => create();
  static $pb.PbList<GetCACertChainResponse> createRepeated() => $pb.PbList<GetCACertChainResponse>();
  @$core.pragma('dart2js:noInline')
  static GetCACertChainResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCACertChainResponse>(create);
  static GetCACertChainResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get chain => $_getN(0);
  @$pb.TagNumber(1)
  set chain($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChain() => $_has(0);
  @$pb.TagNumber(1)
  void clearChain() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
