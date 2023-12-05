//
//  Generated code. Do not modify.
//  source: host_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use listHostsRequestDescriptor instead')
const ListHostsRequest$json = {
  '1': 'ListHostsRequest',
};

/// Descriptor for `ListHostsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listHostsRequestDescriptor = $convert.base64Decode(
    'ChBMaXN0SG9zdHNSZXF1ZXN0');

@$core.Deprecated('Use listHostsResponseDescriptor instead')
const ListHostsResponse$json = {
  '1': 'ListHostsResponse',
  '2': [
    {'1': 'hosts', '3': 1, '4': 3, '5': 11, '6': '.host.Host', '10': 'hosts'},
  ],
};

/// Descriptor for `ListHostsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listHostsResponseDescriptor = $convert.base64Decode(
    'ChFMaXN0SG9zdHNSZXNwb25zZRIgCgVob3N0cxgBIAMoCzIKLmhvc3QuSG9zdFIFaG9zdHM=');

