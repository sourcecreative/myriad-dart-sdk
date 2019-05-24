import 'package:json_annotation/json_annotation.dart';
import 'package:myriad_dart_sdk/src/model/paginated_response.dart';
import 'package:quiver/collection.dart';
import 'package:quiver/core.dart';

import 'customer.dart';
import 'currency.dart';

part 'order.g.dart';

@JsonSerializable(includeIfNull: false)
class Order {
  // order source id from source app
  String sourceId;
  int amount = 0;
  Currency currency;
  List<OrderItem> items;
  Map<String, dynamic> metadata;

  Order(this.items, {this.currency = Currency.USD,this.sourceId,this.metadata}) {
    items.forEach((item) => amount += item.amount);
  }

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);

  bool operator == (o) => o is Order && o.currency == currency && o.amount == amount
    && listsEqual(o.items,items) && o.sourceId == sourceId && mapsEqual(o.metadata,metadata);

  int get hashCode => hash3(currency,items,metadata);

}

@JsonSerializable(includeIfNull: false)
class CreateOrderRequest extends Order {
  Customer customer;

  CreateOrderRequest(this.customer, List<OrderItem> items, 
    {Currency currency = Currency.USD, String sourceId, Map<String,dynamic> metadata} )
    : super(items, currency:currency, sourceId:sourceId, metadata:metadata);

  factory CreateOrderRequest.fromJson(Map<String, dynamic> json) => _$CreateOrderRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateOrderRequestToJson(this);

}

@JsonSerializable(includeIfNull: false)
class OrderItem {
  String product;
  String sku;
  int quantity;
  int unitPrice;
  int amount;
  Map<String, dynamic> metadata;

  OrderItem(this.product,this.quantity,this.unitPrice,{this.sku,this.metadata}) {
    this.amount = quantity * unitPrice;
  }

  factory OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);
  Map<String, dynamic> toJson() => _$OrderItemToJson(this);

  bool operator == (o) => o is OrderItem && o.product == product && o.sku == sku
    && o.quantity == quantity && o.unitPrice == unitPrice && mapsEqual(o.metadata,metadata);

  int get hashCode => hashObjects([product,quantity,unitPrice,sku,metadata]);

}

@JsonSerializable(includeIfNull: false)
class OrderResponse {
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

  OrderResponse(this.id);
//    : super("OrderResponse");

  factory OrderResponse.fromJson(Map<String, dynamic> json) => _$OrderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$OrderResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$OrderResponseFromJson;

}

@JsonSerializable(includeIfNull: false)
class PaginatedOrderResponse extends PaginatedResponse<OrderResponse> {
  PaginatedOrderResponse(List<OrderResponse> entries, int total, { int page=1, int size=20}) 
    : super(entries, total, page:page, size:size);

 factory PaginatedOrderResponse.fromJson(Map<String, dynamic> json) => _$PaginatedOrderResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedOrderResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$PaginatedOrderResponseFromJson;

}