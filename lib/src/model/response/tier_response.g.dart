// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tier_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TierResponse _$TierResponseFromJson(Map<String, dynamic> json) {
  return TierResponse(
      json['id'] as String,
      json['name'] as String,
      (json['rules'] as List)
          ?.map((e) => e == null
              ? null
              : RuleResponse.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      description: json['description'] as String,
      metadata: json['metadata'] as Map<String, dynamic>)
    ..objType = json['objType'] as String;
}

Map<String, dynamic> _$TierResponseToJson(TierResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('objType', instance.objType);
  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  writeNotNull('rules', instance.rules);
  writeNotNull('metadata', instance.metadata);
  return val;
}
