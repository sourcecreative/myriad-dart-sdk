import 'package:json_annotation/json_annotation.dart';
import 'package:quiver/collection.dart';
import 'package:quiver/core.dart';

import 'order.dart';
import 'customer.dart';
import 'voucher.dart';
import 'tier.dart';

part 'validation.g.dart';

@JsonSerializable(includeIfNull: false)
class Validation {
  Order order;
  Customer customer;

  Validation(this.customer, this.order);

  factory Validation.fromJson(Map<String, dynamic> json) => _$ValidationFromJson(json);
  Map<String, dynamic> toJson() => _$ValidationToJson(this);

  bool operator == (o) => o is Validation && o.order == order;
  int get hashCode => order.hashCode;

}

@JsonSerializable(includeIfNull: false)
class VoucherValidation extends Validation {
  String voucherId;

  VoucherValidation(this.voucherId, Customer customer, Order order)
    : super(customer, order);

  factory VoucherValidation.fromJson(Map<String, dynamic> json) => _$VoucherValidationFromJson(json);
  Map<String, dynamic> toJson() => _$VoucherValidationToJson(this);

  bool operator == (o) => o is VoucherValidation && o.voucherId == voucherId && o.order == order;
  int get hashCode => hash2(voucherId,order);

}

abstract class Redemption extends Validation {
  // extra data for the redemption
  Map<String,dynamic> metadata;
  Redemption(Customer customer, Order order, {this.metadata = const <String,dynamic>{}})
    : super(customer, order);
}

@JsonSerializable(includeIfNull: false)
class VoucherRedemption extends Redemption {
  String voucherId;

  VoucherRedemption(this.voucherId, Customer customer, Order order)
    : super(customer, order);

  factory VoucherRedemption.fromJson(Map<String, dynamic> json) => _$VoucherRedemptionFromJson(json);
  Map<String, dynamic> toJson() => _$VoucherRedemptionToJson(this);

  bool operator == (o) => o is VoucherRedemption && o.voucherId == voucherId 
    && o.order == order && o.customer == customer
    && mapsEqual(o.metadata, metadata);
  int get hashCode => hash4(voucherId,order,customer,metadata);

}

@JsonSerializable(includeIfNull: false)
class PromotionRedemption extends Redemption {
  String promotionTierId;

  PromotionRedemption(this.promotionTierId, Customer customer, Order order)
    : super(customer, order);

  factory PromotionRedemption.fromJson(Map<String, dynamic> json) => _$PromotionRedemptionFromJson(json);
  Map<String, dynamic> toJson() => _$PromotionRedemptionToJson(this);

  bool operator == (o) => o is PromotionRedemption && o.promotionTierId == promotionTierId 
    && o.order == order && o.customer == customer
    && mapsEqual(o.metadata, metadata);
  int get hashCode => hash4(promotionTierId,order,customer,metadata);

}

abstract class ValidationResponse {
  OrderResponse order;
  bool valid;

  ValidationResponse(this.order, [this.valid = true]);
}

@JsonSerializable(includeIfNull: false)
class VoucherValidationResponse<T> extends ValidationResponse {
  VoucherResponse<T> voucher;

  VoucherValidationResponse(this.voucher, OrderResponse order, [bool valid = true])
    : super(order, valid);

  factory VoucherValidationResponse.fromJson(Map<String, dynamic> json) => _$VoucherValidationResponseFromJson<T>(json);
  Map<String, dynamic> toJson() => _$VoucherValidationResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$VoucherValidationResponseFromJson;

}

@JsonSerializable(includeIfNull: false)
class PromotionValidationResponse extends ValidationResponse {
  // applicable promotion tiers
  List<TierResponse> tiers;

  PromotionValidationResponse(this.tiers, OrderResponse order, [bool valid = true])
    : super(order, valid);

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

  RedemptionResponse(OrderResponse order, [bool valid = true])
    : super(order, valid);
}

@JsonSerializable(includeIfNull: false)
class VoucherRedemptionResponse<T> extends RedemptionResponse {
  // voucher redeemed
  VoucherResponse<T> voucher;

  VoucherRedemptionResponse(OrderResponse order, this.voucher, [bool valid = true])
    : super(order, valid);

  factory VoucherRedemptionResponse.fromJson(Map<String, dynamic> json) => _$VoucherRedemptionResponseFromJson<T>(json);
  Map<String, dynamic> toJson() => _$VoucherRedemptionResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$VoucherRedemptionResponseFromJson;

}

@JsonSerializable(includeIfNull: false)
class PromotionRedemptionResponse extends RedemptionResponse {
  TierResponse tier;

  PromotionRedemptionResponse(OrderResponse order, this.tier, [bool valid = true])
    : super(order, valid);
  
  factory PromotionRedemptionResponse.fromJson(Map<String, dynamic> json) => _$PromotionRedemptionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PromotionRedemptionResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$PromotionRedemptionResponseFromJson;

}

