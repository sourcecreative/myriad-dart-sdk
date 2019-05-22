import 'package:json_annotation/json_annotation.dart';

import 'response.dart';
import 'customer_response.dart';
import 'order_response.dart';
import 'tier_response.dart';
import 'voucher_response.dart';

part 'validation_response.g.dart';

abstract class ValidationResponse extends TypedResponse {
  OrderResponse order;
  CustomerResponse customer;

  ValidationResponse._create(String objType) : super(objType);
}

@JsonSerializable(includeIfNull: false)
class VoucherValidationResponse<T> extends ValidationResponse {
  VoucherResponse<T> voucher;

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
