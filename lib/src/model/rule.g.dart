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

PaginatedRuleResponse _$PaginatedRuleResponseFromJson(
    Map<String, dynamic> json) {
  return PaginatedRuleResponse(
      (json['entries'] as List)
          ?.map((e) => e == null
              ? null
              : RuleResponse.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['total'] as int,
      page: json['page'] as int,
      size: json['size'] as int);
}

Map<String, dynamic> _$PaginatedRuleResponseToJson(
    PaginatedRuleResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('total', instance.total);
  writeNotNull('page', instance.page);
  writeNotNull('size', instance.size);
  writeNotNull('entries', instance.entries);
  return val;
}
