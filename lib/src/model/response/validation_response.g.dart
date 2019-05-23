// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoucherValidationResponse<T> _$VoucherValidationResponseFromJson<T>(
    Map<String, dynamic> json) {
  return VoucherValidationResponse<T>()
    ..objType = json['objType'] as String
    ..order = json['order'] == null
        ? null
        : OrderResponse.fromJson(json['order'] as Map<String, dynamic>)
    ..voucher = json['voucher'] == null
        ? null
        : VoucherResponse.fromJson(json['voucher'] as Map<String, dynamic>)
    ..valid = json['valid'] as bool;
}

Map<String, dynamic> _$VoucherValidationResponseToJson<T>(
    VoucherValidationResponse<T> instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('objType', instance.objType);
  writeNotNull('order', instance.order);
  writeNotNull('voucher', instance.voucher);
  writeNotNull('valid', instance.valid);
  return val;
}

PromotionValidationResponse<T> _$PromotionValidationResponseFromJson<T>(
    Map<String, dynamic> json) {
  return PromotionValidationResponse<T>()
    ..objType = json['objType'] as String
    ..order = json['order'] == null
        ? null
        : OrderResponse.fromJson(json['order'] as Map<String, dynamic>)
    ..tiers = (json['tiers'] as List)
        ?.map((e) => e == null
            ? null
            : PromotionTierResponse.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PromotionValidationResponseToJson<T>(
    PromotionValidationResponse<T> instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('objType', instance.objType);
  writeNotNull('order', instance.order);
  writeNotNull('tiers', instance.tiers);
  return val;
}

VoucherRedemptionResponse<T> _$VoucherRedemptionResponseFromJson<T>(
    Map<String, dynamic> json) {
  return VoucherRedemptionResponse<T>()
    ..objType = json['objType'] as String
    ..order = json['order'] == null
        ? null
        : OrderResponse.fromJson(json['order'] as Map<String, dynamic>)
    ..id = json['id'] as String
    ..status = _$enumDecodeNullable(_$RedemptionStatusEnumMap, json['status'])
    ..metadata = json['metadata'] as Map<String, dynamic>
    ..voucher = json['voucher'] == null
        ? null
        : VoucherResponse.fromJson(json['voucher'] as Map<String, dynamic>);
}

Map<String, dynamic> _$VoucherRedemptionResponseToJson<T>(
    VoucherRedemptionResponse<T> instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('objType', instance.objType);
  writeNotNull('order', instance.order);
  writeNotNull('id', instance.id);
  writeNotNull('status', _$RedemptionStatusEnumMap[instance.status]);
  writeNotNull('metadata', instance.metadata);
  writeNotNull('voucher', instance.voucher);
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

const _$RedemptionStatusEnumMap = <RedemptionStatus, dynamic>{
  RedemptionStatus.SUCCESS: 'SUCCESS',
  RedemptionStatus.FAILED: 'FAILED'
};

PromotionRedemptionResponse _$PromotionRedemptionResponseFromJson(
    Map<String, dynamic> json) {
  return PromotionRedemptionResponse()
    ..objType = json['objType'] as String
    ..order = json['order'] == null
        ? null
        : OrderResponse.fromJson(json['order'] as Map<String, dynamic>)
    ..id = json['id'] as String
    ..status = _$enumDecodeNullable(_$RedemptionStatusEnumMap, json['status'])
    ..metadata = json['metadata'] as Map<String, dynamic>
    ..tier = json['tier'] == null
        ? null
        : TierResponse.fromJson(json['tier'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PromotionRedemptionResponseToJson(
    PromotionRedemptionResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('objType', instance.objType);
  writeNotNull('order', instance.order);
  writeNotNull('id', instance.id);
  writeNotNull('status', _$RedemptionStatusEnumMap[instance.status]);
  writeNotNull('metadata', instance.metadata);
  writeNotNull('tier', instance.tier);
  return val;
}
