// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignResponse _$CampaignResponseFromJson(Map<String, dynamic> json) {
  return CampaignResponse(
      json['id'] as String,
      json['name'] as String,
      json['type'] as String,
      json['effective'] == null
          ? null
          : DateTime.parse(json['effective'] as String),
      json['expiry'] == null ? null : DateTime.parse(json['expiry'] as String),
      json['metadata'] as Map<String, dynamic>,
      _$enumDecodeNullable(_$CampaignStatusEnumMap, json['status']),
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      json['description'] as String);
}

Map<String, dynamic> _$CampaignResponseToJson(CampaignResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  writeNotNull('name', instance.name);
  writeNotNull('type', instance.type);
  writeNotNull('description', instance.description);
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
  return VoucherCampaignResponse<T>(
      json['id'] as String,
      json['name'] as String,
      json['type'] as String,
      json['effective'] == null
          ? null
          : DateTime.parse(json['effective'] as String),
      json['expiry'] == null ? null : DateTime.parse(json['expiry'] as String),
      json['autoUpdate'] as bool,
      json['config'] == null
          ? null
          : VoucherConfigConverter<T>().fromJson(json['config']),
      (json['rules'] as List)
          ?.map((e) => e == null
              ? null
              : RuleResponse.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['metadata'] as Map<String, dynamic>,
      _$enumDecodeNullable(_$CampaignStatusEnumMap, json['status']),
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      json['description'] as String);
}

Map<String, dynamic> _$VoucherCampaignResponseToJson<T>(
    VoucherCampaignResponse<T> instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  writeNotNull('name', instance.name);
  writeNotNull('type', instance.type);
  writeNotNull('description', instance.description);
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
