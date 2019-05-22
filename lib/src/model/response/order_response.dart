import 'package:json_annotation/json_annotation.dart';

import '../order.dart';
import 'response.dart';

part 'order_response.g.dart';

@JsonSerializable(includeIfNull: false)
class OrderResponse extends TypedResponse {
  String id;
  String sourceId;
  int amount;
  Currency currency;
  List<OrderItem> items;
  Map<String, dynamic> metadata;

  OrderResponse(this.id)
    : super("OrderResponse");

  factory OrderResponse.fromJson(Map<String, dynamic> json) => _$OrderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$OrderResponseFromJson;

}