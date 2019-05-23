// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Validation _$ValidationFromJson(Map<String, dynamic> json) {
  return Validation(
      json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      json['order'] == null
          ? null
          : Order.fromJson(json['order'] as Map<String, dynamic>));
}

Map<String, dynamic> _$ValidationToJson(Validation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('order', instance.order);
  writeNotNull('customer', instance.customer);
  return val;
}

VoucherValidation _$VoucherValidationFromJson(Map<String, dynamic> json) {
  return VoucherValidation(
      json['voucherId'] as String,
      json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      json['order'] == null
          ? null
          : Order.fromJson(json['order'] as Map<String, dynamic>));
}

Map<String, dynamic> _$VoucherValidationToJson(VoucherValidation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('order', instance.order);
  writeNotNull('customer', instance.customer);
  writeNotNull('voucherId', instance.voucherId);
  return val;
}

VoucherRedemption _$VoucherRedemptionFromJson(Map<String, dynamic> json) {
  return VoucherRedemption(
      json['voucherId'] as String,
      json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      json['order'] == null
          ? null
          : Order.fromJson(json['order'] as Map<String, dynamic>))
    ..metadata = json['metadata'] as Map<String, dynamic>;
}

Map<String, dynamic> _$VoucherRedemptionToJson(VoucherRedemption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('order', instance.order);
  writeNotNull('customer', instance.customer);
  writeNotNull('metadata', instance.metadata);
  writeNotNull('voucherId', instance.voucherId);
  return val;
}

PromotionRedemption _$PromotionRedemptionFromJson(Map<String, dynamic> json) {
  return PromotionRedemption(
      json['promotionTierId'] as String,
      json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      json['order'] == null
          ? null
          : Order.fromJson(json['order'] as Map<String, dynamic>))
    ..metadata = json['metadata'] as Map<String, dynamic>;
}

Map<String, dynamic> _$PromotionRedemptionToJson(PromotionRedemption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('order', instance.order);
  writeNotNull('customer', instance.customer);
  writeNotNull('metadata', instance.metadata);
  writeNotNull('promotionTierId', instance.promotionTierId);
  return val;
}
