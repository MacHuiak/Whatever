//
//  Generated code. Do not modify.
//  source: host.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class HostCountry extends $pb.ProtobufEnum {
  static const HostCountry COUNTRY_UNSPECIFIED = HostCountry._(0, _omitEnumNames ? '' : 'COUNTRY_UNSPECIFIED');
  static const HostCountry COUNTRY_IND = HostCountry._(1, _omitEnumNames ? '' : 'COUNTRY_IND');
  static const HostCountry COUNTRY_AUS = HostCountry._(2, _omitEnumNames ? '' : 'COUNTRY_AUS');
  static const HostCountry COUNTRY_SGP = HostCountry._(3, _omitEnumNames ? '' : 'COUNTRY_SGP');
  static const HostCountry COUNTRY_GBR = HostCountry._(4, _omitEnumNames ? '' : 'COUNTRY_GBR');
  static const HostCountry COUNTRY_USA = HostCountry._(5, _omitEnumNames ? '' : 'COUNTRY_USA');
  static const HostCountry COUNTRY_DEU = HostCountry._(6, _omitEnumNames ? '' : 'COUNTRY_DEU');
  static const HostCountry COUNTRY_NLD = HostCountry._(7, _omitEnumNames ? '' : 'COUNTRY_NLD');
  static const HostCountry COUNTRY_CAN = HostCountry._(8, _omitEnumNames ? '' : 'COUNTRY_CAN');

  static const $core.List<HostCountry> values = <HostCountry> [
    COUNTRY_UNSPECIFIED,
    COUNTRY_IND,
    COUNTRY_AUS,
    COUNTRY_SGP,
    COUNTRY_GBR,
    COUNTRY_USA,
    COUNTRY_DEU,
    COUNTRY_NLD,
    COUNTRY_CAN,
  ];

  static final $core.Map<$core.int, HostCountry> _byValue = $pb.ProtobufEnum.initByValue(values);
  static HostCountry? valueOf($core.int value) => _byValue[value];

  const HostCountry._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
