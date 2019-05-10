// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeConfig _$CodeConfigFromJson(Map<String, dynamic> json) {
  return CodeConfig(
      length: json['length'] as int,
      charset: json['charset'] as String,
      pattern: json['pattern'] as String,
      prefix: json['prefix'] as String,
      postfix: json['postfix'] as String);
}

Map<String, dynamic> _$CodeConfigToJson(CodeConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('length', instance.length);
  writeNotNull('charset', instance.charset);
  writeNotNull('prefix', instance.prefix);
  writeNotNull('postfix', instance.postfix);
  writeNotNull('pattern', instance.pattern);
  return val;
}
