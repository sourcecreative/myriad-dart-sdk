import 'package:json_annotation/json_annotation.dart';
import 'package:quiver/collection.dart';
import 'package:quiver/core.dart';

part 'order.g.dart';

@JsonSerializable(includeIfNull: false)
class Currency {
  static const USD = Currency('USD',2);
  static const RMB = Currency("RMB", 2);
  
  final String symbol;
  final int precision;

  const Currency(this.symbol, this.precision);
  factory Currency.fromJson(Map<String, dynamic> json) => _$CurrencyFromJson(json);
  Map<String, dynamic> toJson() => _$CurrencyToJson(this);

  bool operator == (o) => o is Currency && o.symbol == symbol && o.precision == precision;
  int get hashCode => hash2(symbol,precision);
}

@JsonSerializable(includeIfNull: false)
class Order {
  // order source id from source app
  String sourceId;
  int amount;
  Currency currency;
  List<OrderItem> items;
  Map<String, dynamic> metadata;

  Order(this.currency,this.items, {this.sourceId,this.metadata}) {
    items.forEach((item)=>amount += item.amount);
  }

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);

  bool operator == (o) => o is Order && o.currency == currency && o.amount == amount
    && listsEqual(o.items,items) && o.sourceId == sourceId && mapsEqual(o.metadata,metadata);

  int get hashCode => hash3(currency,items,metadata);

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