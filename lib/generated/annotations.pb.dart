//
//  Generated code. Do not modify.
//  source: annotations.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'http.pb.dart' as $8;

class Annotations {
  static final http = $pb.Extension<$8.HttpRule>(_omitMessageNames ? '' : 'google.protobuf.MethodOptions', _omitFieldNames ? '' : 'http', 72295728, $pb.PbFieldType.OM, defaultOrMaker: $8.HttpRule.getDefault, subBuilder: $8.HttpRule.create);
  static void registerAllExtensions($pb.ExtensionRegistry registry) {
    registry.add(http);
  }
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
