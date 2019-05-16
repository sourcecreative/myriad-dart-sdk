// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tier _$TierFromJson(Map<String, dynamic> json) {
  return Tier(
      json['name'] as String,
      (json['rules'] as List)
          ?.map((e) =>
              e == null ? null : Rule.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      description: json['description'] as String,
      metadata: json['metadata']);
}

Map<String, dynamic> _$TierToJson(Tier instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  writeNotNull('rules', instance.rules);
  writeNotNull('metadata', instance.metadata);
  return val;
}
