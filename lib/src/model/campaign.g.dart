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
  CampaignType.LOYALTY_PROGRAM: 'LOYALTY_PROGRAM',
  CampaignType.PROMOTION: 'PROMOTION'
};

LoyaltyProgram _$LoyaltyProgramFromJson(Map<String, dynamic> json) {
  return LoyaltyProgram(
      json['name'] as String,
      json['effective'] == null
          ? null
          : DateTime.parse(json['effective'] as String),
      json['expiry'] == null ? null : DateTime.parse(json['expiry'] as String),
      json['totalSupply'] as int,
      json['config'] == null
          ? null
          : LoyaltyCardConfig.fromJson(json['config'] as Map<String, dynamic>),
      autoUpdate: json['autoUpdate'] as bool,
      description: json['description'] as String,
      category: json['category'] as String,
      metadata: json['metadata'] as Map<String, dynamic>)
    ..type = _$enumDecodeNullable(_$CampaignTypeEnumMap, json['type']);
}

Map<String, dynamic> _$LoyaltyProgramToJson(LoyaltyProgram instance) {
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
  writeNotNull('config', instance.config);
  return val;
}

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

VoucherCampaignResponse<T> _$VoucherCampaignResponseFromJson<T>(
    Map<String, dynamic> json) {
  return VoucherCampaignResponse<T>()
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

const _$CampaignStatusEnumMap = <CampaignStatus, dynamic>{
  CampaignStatus.PENDING: 'PENDING',
  CampaignStatus.ACTIVE: 'ACTIVE',
  CampaignStatus.INACTIVE: 'INACTIVE',
  CampaignStatus.ARCHIVED: 'ARCHIVED'
};

EarningRule _$EarningRuleFromJson(Map<String, dynamic> json) {
  return EarningRule(
      json['name'] as String,
      json['event'] as String,
      json['points'] as int,
      json['rule'] == null
          ? null
          : Rule.fromJson(json['rule'] as Map<String, dynamic>));
}

Map<String, dynamic> _$EarningRuleToJson(EarningRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('event', instance.event);
  writeNotNull('rule', instance.rule);
  writeNotNull('points', instance.points);
  return val;
}

RewardRule _$RewardRuleFromJson(Map<String, dynamic> json) {
  return RewardRule(
      json['name'] as String,
      json['pointsRequired'] as int,
      json['rule'] == null
          ? null
          : Rule.fromJson(json['rule'] as Map<String, dynamic>),
      json['campaignId'] as String);
}

Map<String, dynamic> _$RewardRuleToJson(RewardRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('pointsRequired', instance.pointsRequired);
  writeNotNull('rule', instance.rule);
  writeNotNull('campaignId', instance.campaignId);
  return val;
}

LoyaltyProgramResponse<T> _$LoyaltyProgramResponseFromJson<T>(
    Map<String, dynamic> json) {
  return LoyaltyProgramResponse<T>()
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
        : LoyaltyCardConfig.fromJson(json['config'] as Map<String, dynamic>)
    ..rules = (json['rules'] as List)
        ?.map((e) =>
            e == null ? null : RuleResponse.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..earningRules = (json['earningRules'] as List)
        ?.map((e) =>
            e == null ? null : EarningRule.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..rewardRules = (json['rewardRules'] as List)
        ?.map((e) =>
            e == null ? null : RewardRule.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$LoyaltyProgramResponseToJson<T>(
    LoyaltyProgramResponse<T> instance) {
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
  writeNotNull('category', instance.category);
  writeNotNull('status', _$CampaignStatusEnumMap[instance.status]);
  writeNotNull('effective', instance.effective?.toIso8601String());
  writeNotNull('expiry', instance.expiry?.toIso8601String());
  writeNotNull('metadata', instance.metadata);
  writeNotNull('autoUpdate', instance.autoUpdate);
  writeNotNull('config', instance.config);
  writeNotNull('rules', instance.rules);
  writeNotNull('earningRules', instance.earningRules);
  writeNotNull('rewardRules', instance.rewardRules);
  return val;
}

PromotionCampaignResponse _$PromotionCampaignResponseFromJson(
    Map<String, dynamic> json) {
  return PromotionCampaignResponse()
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
              : VoucherCampaignResponse.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['total'] as int,
      page: json['page'] as int,
      size: json['size'] as int);
}

Map<String, dynamic> _$PaginatedCampaignResponseToJson(
    PaginatedCampaignResponse instance) {
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

PaginatedPromotionResponse _$PaginatedPromotionResponseFromJson(
    Map<String, dynamic> json) {
  return PaginatedPromotionResponse(
      (json['entries'] as List)
          ?.map((e) => e == null
              ? null
              : PromotionCampaignResponse.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['total'] as int,
      page: json['page'] as int,
      size: json['size'] as int);
}

Map<String, dynamic> _$PaginatedPromotionResponseToJson(
    PaginatedPromotionResponse instance) {
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

PaginatedLoyaltyResponse _$PaginatedLoyaltyResponseFromJson(
    Map<String, dynamic> json) {
  return PaginatedLoyaltyResponse(
      (json['entries'] as List)
          ?.map((e) => e == null
              ? null
              : LoyaltyProgramResponse.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['total'] as int,
      page: json['page'] as int,
      size: json['size'] as int);
}

Map<String, dynamic> _$PaginatedLoyaltyResponseToJson(
    PaginatedLoyaltyResponse instance) {
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
