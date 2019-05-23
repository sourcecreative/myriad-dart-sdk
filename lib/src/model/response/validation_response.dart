import 'package:json_annotation/json_annotation.dart';

import 'response.dart';
import 'customer_response.dart';
import 'order_response.dart';
import 'tier_response.dart';
import 'voucher_response.dart';

part 'validation_response.g.dart';

abstract class ValidationResponse extends TypedResponse {
  OrderResponse order;

  ValidationResponse._create(String objType) : super(objType);
}

@JsonSerializable(includeIfNull: false)
class VoucherValidationResponse<T> extends ValidationResponse {
  VoucherResponse<T> voucher;
  // is voucher valid?
  bool valid = false;

  VoucherValidationResponse() : super._create('VoucherValidationResponse');

  factory VoucherValidationResponse.fromJson(Map<String, dynamic> json) => _$VoucherValidationResponseFromJson<T>(json);
  Map<String, dynamic> toJson() => _$VoucherValidationResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$VoucherValidationResponseFromJson;

}

@JsonSerializable(includeIfNull: false)
class PromotionValidationResponse<T> extends ValidationResponse {
  // applicable promotion tiers
  List<PromotionTierResponse> tiers;

  PromotionValidationResponse() : super._create('PromotionValidationResponse');

  factory PromotionValidationResponse.fromJson(Map<String, dynamic> json) => _$PromotionValidationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PromotionValidationResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$PromotionValidationResponseFromJson;

}

enum RedemptionStatus {
  SUCCESS, FAILED
}

abstract class RedemptionResponse extends ValidationResponse {
  // redemption id
  String id;
  RedemptionStatus status;
  Map<String,dynamic> metadata;

  RedemptionResponse._create(String objType) : super._create(objType);
}

@JsonSerializable(includeIfNull: false)
class VoucherRedemptionResponse<T> extends RedemptionResponse {
  // voucher redeemed
  VoucherResponse<T> voucher;

  VoucherRedemptionResponse()
    : super._create('VoucherRedemptionResponse');

  factory VoucherRedemptionResponse.fromJson(Map<String, dynamic> json) => _$VoucherRedemptionResponseFromJson<T>(json);
  Map<String, dynamic> toJson() => _$VoucherRedemptionResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$VoucherRedemptionResponseFromJson;

}

@JsonSerializable(includeIfNull: false)
class PromotionRedemptionResponse extends RedemptionResponse {
  TierResponse tier;

  PromotionRedemptionResponse()
    : super._create('PromotionRedemptionResponse');
  
  factory PromotionRedemptionResponse.fromJson(Map<String, dynamic> json) => _$PromotionRedemptionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PromotionRedemptionResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$PromotionRedemptionResponseFromJson;

}

