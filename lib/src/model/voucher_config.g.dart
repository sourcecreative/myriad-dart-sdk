// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CouponConfig<T> _$CouponConfigFromJson<T extends Discount>(
    Map<String, dynamic> json) {
  return CouponConfig<T>(
      json['codeConfig'] == null
          ? null
          : CodeConfig.fromJson(json['codeConfig'] as Map<String, dynamic>),
      json['discount'] == null
          ? null
          : _DiscountConverter<T>().fromJson(json['discount']),
      json['redemption'] as int)
    ..type = _$enumDecodeNullable(_$VoucherTypeEnumMap, json['type']);
}

Map<String, dynamic> _$CouponConfigToJson<T extends Discount>(
    CouponConfig<T> instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$VoucherTypeEnumMap[instance.type]);
  writeNotNull('redemption', instance.redemption);
  writeNotNull('codeConfig', instance.codeConfig);
  writeNotNull(
      'discount',
      instance.discount == null
          ? null
          : _DiscountConverter<T>().toJson(instance.discount));
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

const _$VoucherTypeEnumMap = <VoucherType, dynamic>{
  VoucherType.COUPON: 'COUPON',
  VoucherType.GIFT: 'GIFT',
  VoucherType.PREPAID_CARD: 'PREPAID_CARD',
  VoucherType.LOYALTY_CARD: 'LOYALTY_CARD'
};

PrepaidCardConfig _$PrepaidCardConfigFromJson(Map<String, dynamic> json) {
  return PrepaidCardConfig(
      json['codeConfig'] == null
          ? null
          : CodeConfig.fromJson(json['codeConfig'] as Map<String, dynamic>),
      json['amount'] as num,
      json['redemption'] as int)
    ..type = _$enumDecodeNullable(_$VoucherTypeEnumMap, json['type']);
}

Map<String, dynamic> _$PrepaidCardConfigToJson(PrepaidCardConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$VoucherTypeEnumMap[instance.type]);
  writeNotNull('redemption', instance.redemption);
  writeNotNull('codeConfig', instance.codeConfig);
  writeNotNull('amount', instance.amount);
  return val;
}

GiftConfig _$GiftConfigFromJson(Map<String, dynamic> json) {
  return GiftConfig(
      json['codeConfig'] == null
          ? null
          : CodeConfig.fromJson(json['codeConfig'] as Map<String, dynamic>),
      json['product'] as String)
    ..type = _$enumDecodeNullable(_$VoucherTypeEnumMap, json['type'])
    ..redemption = json['redemption'] as int;
}

Map<String, dynamic> _$GiftConfigToJson(GiftConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$VoucherTypeEnumMap[instance.type]);
  writeNotNull('redemption', instance.redemption);
  writeNotNull('codeConfig', instance.codeConfig);
  writeNotNull('product', instance.product);
  return val;
}
