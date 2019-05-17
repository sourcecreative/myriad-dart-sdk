// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignResponse _$CampaignResponseFromJson(Map<String, dynamic> json) {
  return CampaignResponse(json['objType'] as String)
    ..id = json['id'] as String
    ..updatedAt = json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String)
    ..name = json['name'] as String
    ..type = json['type'] as String
    ..description = json['description'] as String
    ..category = json['category'] as String
    ..status = _$enumDecodeNullable(_$CampaignStatusEnumMap, json['status'])
    ..effective = json['effective'] == null
        ? null
        : DateTime.parse(json['effective'] as String)
    ..expiry =
        json['expiry'] == null ? null : DateTime.parse(json['expiry'] as String)
    ..metadata = json['metadata'] as Map<String, dynamic>;
}

Map<String, dynamic> _$CampaignResponseToJson(CampaignResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('objType', instance.objType);
  writeNotNull('id', instance.id);
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  writeNotNull('name', instance.name);
  writeNotNull('type', instance.type);
  writeNotNull('description', instance.description);
  writeNotNull('category', instance.category);
  writeNotNull('status', _$CampaignStatusEnumMap[instance.status]);
  writeNotNull('effective', instance.effective?.toIso8601String());
  writeNotNull('expiry', instance.expiry?.toIso8601String());
  writeNotNull('metadata', instance.metadata);
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

const _$CampaignStatusEnumMap = <CampaignStatus, dynamic>{
  CampaignStatus.PENDING: 'PENDING',
  CampaignStatus.ACTIVE: 'ACTIVE',
  CampaignStatus.INACTIVE: 'INACTIVE',
  CampaignStatus.ARCHIVED: 'ARCHIVED'
};

VoucherCampaignResponse<T> _$VoucherCampaignResponseFromJson<T>(
    Map<String, dynamic> json) {
  return VoucherCampaignResponse<T>()
    ..objType = json['objType'] as String
    ..id = json['id'] as String
    ..updatedAt = json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String)
    ..name = json['name'] as String
    ..type = json['type'] as String
    ..description = json['description'] as String
    ..category = json['category'] as String
    ..status = _$enumDecodeNullable(_$CampaignStatusEnumMap, json['status'])
    ..effective = json['effective'] == null
        ? null
        : DateTime.parse(json['effective'] as String)
    ..expiry =
        json['expiry'] == null ? null : DateTime.parse(json['expiry'] as String)
    ..metadata = json['metadata'] as Map<String, dynamic>
    ..autoUpdate = json['autoUpdate'] as bool
    ..config = json['config'] == null
        ? null
        : VoucherConfigConverter<T>().fromJson(json['config'])
    ..rules = (json['rules'] as List)
        ?.map((e) =>
            e == null ? null : RuleResponse.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$VoucherCampaignResponseToJson<T>(
    VoucherCampaignResponse<T> instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('objType', instance.objType);
  writeNotNull('id', instance.id);
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  writeNotNull('name', instance.name);
  writeNotNull('type', instance.type);
  writeNotNull('description', instance.description);
  writeNotNull('category', instance.category);
  writeNotNull('status', _$CampaignStatusEnumMap[instance.status]);
  writeNotNull('effective', instance.effective?.toIso8601String());
  writeNotNull('expiry', instance.expiry?.toIso8601String());
  writeNotNull('metadata', instance.metadata);
  writeNotNull('autoUpdate', instance.autoUpdate);
  writeNotNull(
      'config',
      instance.config == null
          ? null
          : VoucherConfigConverter<T>().toJson(instance.config));
  writeNotNull('rules', instance.rules);
  return val;
}

PromotionCampaignResponse _$PromotionCampaignResponseFromJson(
    Map<String, dynamic> json) {
  return PromotionCampaignResponse()
    ..objType = json['objType'] as String
    ..id = json['id'] as String
    ..updatedAt = json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String)
    ..name = json['name'] as String
    ..type = json['type'] as String
    ..description = json['description'] as String
    ..category = json['category'] as String
    ..status = _$enumDecodeNullable(_$CampaignStatusEnumMap, json['status'])
    ..effective = json['effective'] == null
        ? null
        : DateTime.parse(json['effective'] as String)
    ..expiry =
        json['expiry'] == null ? null : DateTime.parse(json['expiry'] as String)
    ..metadata = json['metadata'] as Map<String, dynamic>
    ..tiers = (json['tiers'] as List)
        ?.map((e) =>
            e == null ? null : TierResponse.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PromotionCampaignResponseToJson(
    PromotionCampaignResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('objType', instance.objType);
  writeNotNull('id', instance.id);
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  writeNotNull('name', instance.name);
  writeNotNull('type', instance.type);
  writeNotNull('description', instance.description);
  writeNotNull('category', instance.category);
  writeNotNull('status', _$CampaignStatusEnumMap[instance.status]);
  writeNotNull('effective', instance.effective?.toIso8601String());
  writeNotNull('expiry', instance.expiry?.toIso8601String());
  writeNotNull('metadata', instance.metadata);
  writeNotNull('tiers', instance.tiers);
  return val;
}

PaginatedCampaignResponse _$PaginatedCampaignResponseFromJson(
    Map<String, dynamic> json) {
  return PaginatedCampaignResponse(
      (json['entries'] as List)
          ?.map((e) => e == null
              ? null
              : CampaignResponse.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['total'] as int,
      page: json['page'] as int,
      size: json['size'] as int)
    ..objType = json['objType'] as String;
}

Map<String, dynamic> _$PaginatedCampaignResponseToJson(
    PaginatedCampaignResponse instance) {
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
