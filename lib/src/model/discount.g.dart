// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount.dart';

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
