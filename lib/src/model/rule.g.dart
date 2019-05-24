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

RuleAssignment _$RuleAssignmentFromJson(Map<String, dynamic> json) {
  return RuleAssignment(
      campaignId: json['campaignId'] as String,
      voucherId: json['voucherId'] as String,
      promotionId: json['promotionId'] as String);
}

Map<String, dynamic> _$RuleAssignmentToJson(RuleAssignment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('campaignId', instance.campaignId);
  writeNotNull('voucherId', instance.voucherId);
  writeNotNull('promotionId', instance.promotionId);
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

RuleAssignmentResponse _$RuleAssignmentResponseFromJson(
    Map<String, dynamic> json) {
  return RuleAssignmentResponse(
      json['id'] as String,
      _$enumDecodeNullable(_$RuleAssignmentTypeEnumMap, json['type']),
      json['ruleId'] as String,
      json['objectId'] as String);
}

Map<String, dynamic> _$RuleAssignmentResponseToJson(
    RuleAssignmentResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', _$RuleAssignmentTypeEnumMap[instance.type]);
  writeNotNull('ruleId', instance.ruleId);
  writeNotNull('objectId', instance.objectId);
  return val;
}

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

T _$enumDecodeNullable<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source);
}

const _$RuleAssignmentTypeEnumMap = <RuleAssignmentType, dynamic>{
  RuleAssignmentType.CAMPAIGN: 'CAMPAIGN',
  RuleAssignmentType.VOUCHER: 'VOUCHER',
  RuleAssignmentType.PROMOTION: 'PROMOTION'
};

PaginatedRuleAssignmentResponse _$PaginatedRuleAssignmentResponseFromJson(
    Map<String, dynamic> json) {
  return PaginatedRuleAssignmentResponse(
      (json['entries'] as List)
          ?.map((e) => e == null
              ? null
              : RuleAssignmentResponse.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['total'] as int,
      page: json['page'] as int,
      size: json['size'] as int);
}

Map<String, dynamic> _$PaginatedRuleAssignmentResponseToJson(
    PaginatedRuleAssignmentResponse instance) {
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
