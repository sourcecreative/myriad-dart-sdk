import 'package:json_annotation/json_annotation.dart';
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

  VoucherValidation(this.voucherId, customer, order)
    : super(customer, order);

  factory VoucherValidation.fromJson(Map<String, dynamic> json) => _$VoucherValidationFromJson(json);
  Map<String, dynamic> toJson() => _$VoucherValidationToJson(this);

  bool operator == (o) => o is VoucherValidation && o.voucherId == voucherId && o.order == order;
  int get hashCode => hash2(voucherId,order);

}