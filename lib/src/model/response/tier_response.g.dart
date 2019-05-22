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

PromotionTierResponse _$PromotionTierResponseFromJson(
    Map<String, dynamic> json) {
  return PromotionTierResponse(json['campaignId'] as String)
    ..objType = json['objType'] as String
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..description = json['description'] as String
    ..rules = (json['rules'] as List)
        ?.map((e) =>
            e == null ? null : RuleResponse.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..metadata = json['metadata'] as Map<String, dynamic>;
}

Map<String, dynamic> _$PromotionTierResponseToJson(
    PromotionTierResponse instance) {
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
  writeNotNull('campaignId', instance.campaignId);
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
      size: json['size'] as int)
    ..objType = json['objType'] as String;
}

Map<String, dynamic> _$PaginatedTierResponseToJson(
    PaginatedTierResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('objType', instance.objType);
  writeNotNull('total', instance.total);
  writeNotNull('page', instance.page);
  writeNotNull('size', instance.size);
  writeNotNull('entries', instance.entries);
  return val;
}
