//
//  Generated code. Do not modify.
//  source: account_service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createAccountRequestDescriptor instead')
const CreateAccountRequest$json = {
  '1': 'CreateAccountRequest',
  '2': [
    {'1': 'account', '3': 1, '4': 1, '5': 11, '6': '.account.Account', '10': 'account'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'subscription_duration', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Duration', '10': 'subscriptionDuration'},
  ],
};

/// Descriptor for `CreateAccountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAccountRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVBY2NvdW50UmVxdWVzdBIqCgdhY2NvdW50GAEgASgLMhAuYWNjb3VudC5BY2NvdW'
    '50UgdhY2NvdW50EhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZBJOChVzdWJzY3JpcHRpb25f'
    'ZHVyYXRpb24YAyABKAsyGS5nb29nbGUucHJvdG9idWYuRHVyYXRpb25SFHN1YnNjcmlwdGlvbk'
    'R1cmF0aW9u');

@$core.Deprecated('Use banAccountRequestDescriptor instead')
const BanAccountRequest$json = {
  '1': 'BanAccountRequest',
  '2': [
    {'1': 'account_id', '3': 1, '4': 1, '5': 9, '10': 'accountId'},
  ],
};

/// Descriptor for `BanAccountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List banAccountRequestDescriptor = $convert.base64Decode(
    'ChFCYW5BY2NvdW50UmVxdWVzdBIdCgphY2NvdW50X2lkGAEgASgJUglhY2NvdW50SWQ=');

