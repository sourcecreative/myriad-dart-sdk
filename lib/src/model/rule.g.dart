// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rule _$RuleFromJson(Map<String, dynamic> json) {
  return Rule(
      json['name'] as String,
      json['description'] as String,
      json['condition'] as String,
      json['action'] as String,
      json['priority'] as int);
}

Map<String, dynamic> _$RuleToJson(Rule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  writeNotNull('condition', instance.condition);
  writeNotNull('action', instance.action);
  writeNotNull('priority', instance.priority);
  return val;
}
