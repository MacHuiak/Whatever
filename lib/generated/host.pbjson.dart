//
//  Generated code. Do not modify.
//  source: host.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use hostCountryDescriptor instead')
const HostCountry$json = {
  '1': 'HostCountry',
  '2': [
    {'1': 'COUNTRY_UNSPECIFIED', '2': 0},
    {'1': 'COUNTRY_IND', '2': 1},
    {'1': 'COUNTRY_AUS', '2': 2},
    {'1': 'COUNTRY_SGP', '2': 3},
    {'1': 'COUNTRY_GBR', '2': 4},
    {'1': 'COUNTRY_USA', '2': 5},
    {'1': 'COUNTRY_DEU', '2': 6},
    {'1': 'COUNTRY_NLD', '2': 7},
    {'1': 'COUNTRY_CAN', '2': 8},
  ],
};

/// Descriptor for `HostCountry`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List hostCountryDescriptor = $convert.base64Decode(
    'CgtIb3N0Q291bnRyeRIXChNDT1VOVFJZX1VOU1BFQ0lGSUVEEAASDwoLQ09VTlRSWV9JTkQQAR'
    'IPCgtDT1VOVFJZX0FVUxACEg8KC0NPVU5UUllfU0dQEAMSDwoLQ09VTlRSWV9HQlIQBBIPCgtD'
    'T1VOVFJZX1VTQRAFEg8KC0NPVU5UUllfREVVEAYSDwoLQ09VTlRSWV9OTEQQBxIPCgtDT1VOVF'
    'JZX0NBThAI');

@$core.Deprecated('Use hostDescriptor instead')
const Host$json = {
  '1': 'Host',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'ip', '3': 2, '4': 1, '5': 12, '10': 'ip'},
    {'1': 'country', '3': 3, '4': 1, '5': 14, '6': '.host.HostCountry', '10': 'country'},
  ],
};

/// Descriptor for `Host`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hostDescriptor = $convert.base64Decode(
    'CgRIb3N0Eg4KAmlkGAEgASgJUgJpZBIOCgJpcBgCIAEoDFICaXASKwoHY291bnRyeRgDIAEoDj'
    'IRLmhvc3QuSG9zdENvdW50cnlSB2NvdW50cnk=');

