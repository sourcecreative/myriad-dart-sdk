// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoucherCampaign<T> _$VoucherCampaignFromJson<T extends VoucherConfig>(
    Map<String, dynamic> json) {
  return VoucherCampaign<T>(
      json['name'] as String,
      json['effective'] == null
          ? null
          : DateTime.parse(json['effective'] as String),
      json['expiry'] == null ? null : DateTime.parse(json['expiry'] as String),
      json['totalSupply'] as int,
      json['config'] == null
          ? null
          : VoucherConfigConverter<T>().fromJson(json['config']),
      autoUpdate: json['autoUpdate'] as bool,
      rules: (json['rules'] as List)
          ?.map((e) =>
              e == null ? null : Rule.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      description: json['description'] as String,
      category: json['category'] as String,
      metadata: json['metadata'] as Map<String, dynamic>)
    ..type = _$enumDecodeNullable(_$CampaignTypeEnumMap, json['type']);
}

Map<String, dynamic> _$VoucherCampaignToJson<T extends VoucherConfig>(
    VoucherCampaign<T> instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  writeNotNull('category', instance.category);
  writeNotNull('effective', instance.effective?.toIso8601String());
  writeNotNull('expiry', instance.expiry?.toIso8601String());
  writeNotNull('type', _$CampaignTypeEnumMap[instance.type]);
  writeNotNull('metadata', instance.metadata);
  writeNotNull('totalSupply', instance.totalSupply);
  writeNotNull('autoUpdate', instance.autoUpdate);
  writeNotNull(
      'config',
      instance.config == null
          ? null
          : VoucherConfigConverter<T>().toJson(instance.config));
  writeNotNull('rules', instance.rules);
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

const _$CampaignTypeEnumMap = <CampaignType, dynamic>{
  CampaignType.VOUCHER: 'VOUCHER',
  CampaignType.REFERRAL: 'REFERRAL',
  CampaignType.PROMOTION: 'PROMOTION'
};

PromotionCampaign _$PromotionCampaignFromJson(Map<String, dynamic> json) {
  return PromotionCampaign(
      json['name'] as String,
      json['effective'] == null
          ? null
          : DateTime.parse(json['effective'] as String),
      json['expiry'] == null ? null : DateTime.parse(json['expiry'] as String),
      (json['tiers'] as List)
          ?.map((e) =>
              e == null ? null : Tier.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      description: json['description'] as String,
      category: json['category'] as String,
      metadata: json['metadata'] as Map<String, dynamic>)
    ..type = _$enumDecodeNullable(_$CampaignTypeEnumMap, json['type']);
}

Map<String, dynamic> _$PromotionCampaignToJson(PromotionCampaign instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('description', instance.description);
  writeNotNull('category', instance.category);
  writeNotNull('effective', instance.effective?.toIso8601String());
  writeNotNull('expiry', instance.expiry?.toIso8601String());
  writeNotNull('type', _$CampaignTypeEnumMap[instance.type]);
  writeNotNull('metadata', instance.metadata);
  writeNotNull('tiers', instance.tiers);
  return val;
}

UpdateCampaign _$UpdateCampaignFromJson(Map<String, dynamic> json) {
  return UpdateCampaign(
      description: json['description'] as String,
      category: json['category'] as String,
      effective: json['effective'] == null
          ? null
          : DateTime.parse(json['effective'] as String),
      expiry: json['expiry'] == null
          ? null
          : DateTime.parse(json['expiry'] as String),
      metadata: json['metadata'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UpdateCampaignToJson(UpdateCampaign instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('description', instance.description);
  writeNotNull('category', instance.category);
  writeNotNull('effective', instance.effective?.toIso8601String());
  writeNotNull('expiry', instance.expiry?.toIso8601String());
  writeNotNull('metadata', instance.metadata);
  return val;
}
