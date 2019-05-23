// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Voucher<T> _$VoucherFromJson<T extends VoucherConfig>(
    Map<String, dynamic> json) {
  return Voucher<T>(
      json['config'] == null
          ? null
          : VoucherConfigConverter<T>().fromJson(json['config']),
      code: json['code'] as String,
      metadata: json['metadata'] as Map<String, dynamic>)
    ..category = json['category'] as String;
}

Map<String, dynamic> _$VoucherToJson<T extends VoucherConfig>(
    Voucher<T> instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull(
      'config',
      instance.config == null
          ? null
          : VoucherConfigConverter<T>().toJson(instance.config));
  writeNotNull('metadata', instance.metadata);
  writeNotNull('category', instance.category);
  return val;
}

UpdateVoucher _$UpdateVoucherFromJson(Map<String, dynamic> json) {
  return UpdateVoucher(
      category: json['category'] as String,
      effective: json['effective'] == null
          ? null
          : DateTime.parse(json['effective'] as String),
      expiry: json['expiry'] == null
          ? null
          : DateTime.parse(json['expiry'] as String),
      metadata: json['metadata'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UpdateVoucherToJson(UpdateVoucher instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('category', instance.category);
  writeNotNull('effective', instance.effective?.toIso8601String());
  writeNotNull('expiry', instance.expiry?.toIso8601String());
  writeNotNull('metadata', instance.metadata);
  return val;
}

VoucherResponse<T> _$VoucherResponseFromJson<T>(Map<String, dynamic> json) {
  return VoucherResponse<T>()
    ..id = json['id'] as String
    ..updatedAt = json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String)
    ..campaignId = json['campaignId'] as String
    ..code = json['code'] as String
    ..status = _$enumDecodeNullable(_$VoucherStatusEnumMap, json['status'])
    ..redeemedQuantity = json['redeemedQuantity'] as int
    ..config = json['config'] == null
        ? null
        : VoucherConfigConverter<T>().fromJson(json['config'])
    ..rules = (json['rules'] as List)
        ?.map((e) =>
            e == null ? null : RuleResponse.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..metadata = json['metadata'] as Map<String, dynamic>;
}

Map<String, dynamic> _$VoucherResponseToJson<T>(VoucherResponse<T> instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  writeNotNull('campaignId', instance.campaignId);
  writeNotNull('code', instance.code);
  writeNotNull('status', _$VoucherStatusEnumMap[instance.status]);
  writeNotNull('redeemedQuantity', instance.redeemedQuantity);
  writeNotNull(
      'config',
      instance.config == null
          ? null
          : VoucherConfigConverter<T>().toJson(instance.config));
  writeNotNull('rules', instance.rules);
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

const _$VoucherStatusEnumMap = <VoucherStatus, dynamic>{
  VoucherStatus.ISSUED: 'ISSUED',
  VoucherStatus.DISTRIBUTED: 'DISTRIBUTED',
  VoucherStatus.REDEEMED: 'REDEEMED',
  VoucherStatus.DISABLED: 'DISABLED'
};

PaginatedVoucherResponse _$PaginatedVoucherResponseFromJson(
    Map<String, dynamic> json) {
  return PaginatedVoucherResponse(
      (json['entries'] as List)
          ?.map((e) => e == null
              ? null
              : VoucherResponse.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['total'] as int,
      page: json['page'] as int,
      size: json['size'] as int);
}

Map<String, dynamic> _$PaginatedVoucherResponseToJson(
    PaginatedVoucherResponse instance) {
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

ImportVoucherResponse _$ImportVoucherResponseFromJson(
    Map<String, dynamic> json) {
  return ImportVoucherResponse()
    ..count = json['count'] as int
    ..imported = json['imported'] as int;
}

Map<String, dynamic> _$ImportVoucherResponseToJson(
    ImportVoucherResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  writeNotNull('imported', instance.imported);
  return val;
}
