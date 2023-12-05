//
//  Generated code. Do not modify.
//  source: openvpn_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use signClientCertRequestDescriptor instead')
const SignClientCertRequest$json = {
  '1': 'SignClientCertRequest',
  '2': [
    {'1': 'csr', '3': 1, '4': 1, '5': 12, '10': 'csr'},
  ],
};

/// Descriptor for `SignClientCertRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signClientCertRequestDescriptor = $convert.base64Decode(
    'ChVTaWduQ2xpZW50Q2VydFJlcXVlc3QSEAoDY3NyGAEgASgMUgNjc3I=');

@$core.Deprecated('Use signClientCertResponseDescriptor instead')
const SignClientCertResponse$json = {
  '1': 'SignClientCertResponse',
  '2': [
    {'1': 'cert', '3': 1, '4': 1, '5': 12, '10': 'cert'},
  ],
};

/// Descriptor for `SignClientCertResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signClientCertResponseDescriptor = $convert.base64Decode(
    'ChZTaWduQ2xpZW50Q2VydFJlc3BvbnNlEhIKBGNlcnQYASABKAxSBGNlcnQ=');

@$core.Deprecated('Use getCACertChainRequestDescriptor instead')
const GetCACertChainRequest$json = {
  '1': 'GetCACertChainRequest',
};

/// Descriptor for `GetCACertChainRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCACertChainRequestDescriptor = $convert.base64Decode(
    'ChVHZXRDQUNlcnRDaGFpblJlcXVlc3Q=');

@$core.Deprecated('Use getCACertChainResponseDescriptor instead')
const GetCACertChainResponse$json = {
  '1': 'GetCACertChainResponse',
  '2': [
    {'1': 'chain', '3': 1, '4': 1, '5': 12, '10': 'chain'},
  ],
};

/// Descriptor for `GetCACertChainResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCACertChainResponseDescriptor = $convert.base64Decode(
    'ChZHZXRDQUNlcnRDaGFpblJlc3BvbnNlEhQKBWNoYWluGAEgASgMUgVjaGFpbg==');

