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
    ..campaignId = json['campaignId'] as String;
}

Map<String, dynamic> _$TierResponseToJson(TierResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('campaignId', instance.campaignId);
  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  writeNotNull('rules', instance.rules);
  writeNotNull('metadata', instance.metadata);
  return val;
}

PaginatedTierResponse _$PaginatedTierResponseFromJson(
    Map<String, dynamic> json) {
  return PaginatedTierResponse(
      (json['entries'] as List)
          ?.map((e) => e == null
              ? null
              : TierResponse.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['total'] as int,
      page: json['page'] as int,
      size: json['size'] as int);
}

Map<String, dynamic> _$PaginatedTierResponseToJson(
    PaginatedTierResponse instance) {
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
