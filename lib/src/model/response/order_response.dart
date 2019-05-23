import 'package:json_annotation/json_annotation.dart';

import '../order.dart';
import 'customer_response.dart';
import 'response.dart';

part 'order_response.g.dart';

@JsonSerializable(includeIfNull: false)
class OrderResponse extends TypedResponse {
  // internal order identifier
  String id;
  // source order identifier
  String sourceId;
  // total amount of this order, excluding discount
  int amount;
  // how much discount can be applied to this order
  int discount;
  Currency currency;
  List<OrderItem> items;
  // who placed the order
  CustomerResponse customer;
  // metadata of the order
  Map<String, dynamic> metadata;

  OrderResponse(this.id)
    : super("OrderResponse");

  factory OrderResponse.fromJson(Map<String, dynamic> json) => _$OrderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$OrderResponseFromJson;

}