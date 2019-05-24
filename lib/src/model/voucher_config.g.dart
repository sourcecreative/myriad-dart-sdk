// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AmountDiscount _$AmountDiscountFromJson(Map<String, dynamic> json) {
  return AmountDiscount(json['amountOff'] as int)
    ..type = _$enumDecodeNullable(_$DiscountTypeEnumMap, json['type']);
}

Map<String, dynamic> _$AmountDiscountToJson(AmountDiscount instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$DiscountTypeEnumMap[instance.type]);
  writeNotNull('amountOff', instance.amountOff);
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

const _$DiscountTypeEnumMap = <DiscountType, dynamic>{
  DiscountType.AMOUNT: 'AMOUNT',
  DiscountType.PERCENT: 'PERCENT',
  DiscountType.UNIT: 'UNIT'
};

PercentDiscount _$PercentDiscountFromJson(Map<String, dynamic> json) {
  return PercentDiscount((json['percentOff'] as num)?.toDouble())
    ..type = _$enumDecodeNullable(_$DiscountTypeEnumMap, json['type']);
}

Map<String, dynamic> _$PercentDiscountToJson(PercentDiscount instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$DiscountTypeEnumMap[instance.type]);
  writeNotNull('percentOff', instance.percentOff);
  return val;
}

UnitDiscount _$UnitDiscountFromJson(Map<String, dynamic> json) {
  return UnitDiscount(json['unitOff'] as int, json['unitType'] as String)
    ..type = _$enumDecodeNullable(_$DiscountTypeEnumMap, json['type']);
}

Map<String, dynamic> _$UnitDiscountToJson(UnitDiscount instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$DiscountTypeEnumMap[instance.type]);
  writeNotNull('unitOff', instance.unitOff);
  writeNotNull('unitType', instance.unitType);
  return val;
}

CodeConfig _$CodeConfigFromJson(Map<String, dynamic> json) {
  return CodeConfig(
      length: json['length'] as int,
      charset: json['charset'] as String,
      pattern: json['pattern'] as String,
      prefix: json['prefix'] as String,
      postfix: json['postfix'] as String);
}

Map<String, dynamic> _$CodeConfigToJson(CodeConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('length', instance.length);
  writeNotNull('charset', instance.charset);
  writeNotNull('prefix', instance.prefix);
  writeNotNull('postfix', instance.postfix);
  writeNotNull('pattern', instance.pattern);
  return val;
}

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

LoyaltyCardConfig _$LoyaltyCardConfigFromJson(Map<String, dynamic> json) {
  return LoyaltyCardConfig(json['codeConfig'] == null
      ? null
      : CodeConfig.fromJson(json['codeConfig'] as Map<String, dynamic>))
    ..type = _$enumDecodeNullable(_$VoucherTypeEnumMap, json['type'])
    ..redemption = json['redemption'] as int;
}

Map<String, dynamic> _$LoyaltyCardConfigToJson(LoyaltyCardConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$VoucherTypeEnumMap[instance.type]);
  writeNotNull('redemption', instance.redemption);
  writeNotNull('codeConfig', instance.codeConfig);
  return val;
}
