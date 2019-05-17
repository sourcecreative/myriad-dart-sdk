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
      metadata: json['metadata'] as Map<String, dynamic>);
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
