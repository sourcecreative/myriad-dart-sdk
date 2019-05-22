// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currency _$CurrencyFromJson(Map<String, dynamic> json) {
  return Currency(json['symbol'] as String, json['precision'] as int);
}

Map<String, dynamic> _$CurrencyToJson(Currency instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('symbol', instance.symbol);
  writeNotNull('precision', instance.precision);
  return val;
}

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
      json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
      (json['items'] as List)
          ?.map((e) =>
              e == null ? null : OrderItem.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      sourceId: json['sourceId'] as String,
      metadata: json['metadata'] as Map<String, dynamic>)
    ..amount = json['amount'] as int;
}

Map<String, dynamic> _$OrderToJson(Order instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sourceId', instance.sourceId);
  writeNotNull('amount', instance.amount);
  writeNotNull('currency', instance.currency);
  writeNotNull('items', instance.items);
  writeNotNull('metadata', instance.metadata);
  return val;
}

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return OrderItem(json['product'] as String, json['quantity'] as int,
      json['unitPrice'] as int,
      sku: json['sku'] as String,
      metadata: json['metadata'] as Map<String, dynamic>)
    ..amount = json['amount'] as int;
}

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('product', instance.product);
  writeNotNull('sku', instance.sku);
  writeNotNull('quantity', instance.quantity);
  writeNotNull('unitPrice', instance.unitPrice);
  writeNotNull('amount', instance.amount);
  writeNotNull('metadata', instance.metadata);
  return val;
}
