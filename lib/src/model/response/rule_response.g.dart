// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RuleResponse _$RuleResponseFromJson(Map<String, dynamic> json) {
  return RuleResponse(
      json['id'] as String,
      json['name'] as String,
      json['description'] as String,
      json['condition'] as String,
      json['action'] as String,
      json['priority'] as int);
}

Map<String, dynamic> _$RuleResponseToJson(RuleResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  writeNotNull('condition', instance.condition);
  writeNotNull('action', instance.action);
  writeNotNull('priority', instance.priority);
  return val;
}
