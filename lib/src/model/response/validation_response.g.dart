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
    ..customer = json['customer'] == null
        ? null
        : CustomerResponse.fromJson(json['customer'] as Map<String, dynamic>)
    ..voucher = json['voucher'] == null
        ? null
        : VoucherResponse.fromJson(json['voucher'] as Map<String, dynamic>);
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
  writeNotNull('customer', instance.customer);
  writeNotNull('voucher', instance.voucher);
  return val;
}

PromotionValidationResponse<T> _$PromotionValidationResponseFromJson<T>(
    Map<String, dynamic> json) {
  return PromotionValidationResponse<T>()
    ..objType = json['objType'] as String
    ..order = json['order'] == null
        ? null
        : OrderResponse.fromJson(json['order'] as Map<String, dynamic>)
    ..customer = json['customer'] == null
        ? null
        : CustomerResponse.fromJson(json['customer'] as Map<String, dynamic>)
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
  writeNotNull('customer', instance.customer);
  writeNotNull('tiers', instance.tiers);
  return val;
}
