//
//  Generated code. Do not modify.
//  source: host_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'host.pb.dart' as $4;

class ListHostsRequest extends $pb.GeneratedMessage {
  factory ListHostsRequest() => create();
  ListHostsRequest._() : super();
  factory ListHostsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListHostsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListHostsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'host'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListHostsRequest clone() => ListHostsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListHostsRequest copyWith(void Function(ListHostsRequest) updates) => super.copyWith((message) => updates(message as ListHostsRequest)) as ListHostsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListHostsRequest create() => ListHostsRequest._();
  ListHostsRequest createEmptyInstance() => create();
  static $pb.PbList<ListHostsRequest> createRepeated() => $pb.PbList<ListHostsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListHostsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListHostsRequest>(create);
  static ListHostsRequest? _defaultInstance;
}

class ListHostsResponse extends $pb.GeneratedMessage {
  factory ListHostsResponse() => create();
  ListHostsResponse._() : super();
  factory ListHostsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListHostsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListHostsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'host'), createEmptyInstance: create)
    ..pc<$4.Host>(1, _omitFieldNames ? '' : 'hosts', $pb.PbFieldType.PM, subBuilder: $4.Host.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListHostsResponse clone() => ListHostsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListHostsResponse copyWith(void Function(ListHostsResponse) updates) => super.copyWith((message) => updates(message as ListHostsResponse)) as ListHostsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListHostsResponse create() => ListHostsResponse._();
  ListHostsResponse createEmptyInstance() => create();
  static $pb.PbList<ListHostsResponse> createRepeated() => $pb.PbList<ListHostsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListHostsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListHostsResponse>(create);
  static ListHostsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$4.Host> get hosts => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
