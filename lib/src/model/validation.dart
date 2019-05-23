import 'package:json_annotation/json_annotation.dart';
import 'package:quiver/collection.dart';
import 'package:quiver/core.dart';

import 'order.dart';
import 'customer.dart';

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