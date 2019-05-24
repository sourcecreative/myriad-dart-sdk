// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
      (json['items'] as List)
          ?.map((e) =>
              e == null ? null : OrderItem.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      currency: json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
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

CreateOrderRequest _$CreateOrderRequestFromJson(Map<String, dynamic> json) {
  return CreateOrderRequest(
      json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      (json['items'] as List)
          ?.map((e) =>
              e == null ? null : OrderItem.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      currency: json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
      sourceId: json['sourceId'] as String,
      metadata: json['metadata'] as Map<String, dynamic>)
    ..amount = json['amount'] as int;
}

Map<String, dynamic> _$CreateOrderRequestToJson(CreateOrderRequest instance) {
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
  writeNotNull('customer', instance.customer);
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

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) {
  return OrderResponse(json['id'] as String)
    ..sourceId = json['sourceId'] as String
    ..amount = json['amount'] as int
    ..discount = json['discount'] as int
    ..currency = json['currency'] == null
        ? null
        : Currency.fromJson(json['currency'] as Map<String, dynamic>)
    ..items = (json['items'] as List)
        ?.map((e) =>
            e == null ? null : OrderItem.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..customer = json['customer'] == null
        ? null
        : CustomerResponse.fromJson(json['customer'] as Map<String, dynamic>)
    ..metadata = json['metadata'] as Map<String, dynamic>;
}

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('sourceId', instance.sourceId);
  writeNotNull('amount', instance.amount);
  writeNotNull('discount', instance.discount);
  writeNotNull('currency', instance.currency);
  writeNotNull('items', instance.items);
  writeNotNull('customer', instance.customer);
  writeNotNull('metadata', instance.metadata);
  return val;
}

PaginatedOrderResponse _$PaginatedOrderResponseFromJson(
    Map<String, dynamic> json) {
  return PaginatedOrderResponse(
      (json['entries'] as List)
          ?.map((e) => e == null
              ? null
              : OrderResponse.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['total'] as int,
      page: json['page'] as int,
      size: json['size'] as int);
}

Map<String, dynamic> _$PaginatedOrderResponseToJson(
    PaginatedOrderResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('total', instance.total);
  writeNotNull('page', instance.page);
  writeNotNull('size', instance.size);
  writeNotNull('entries', instance.entries);
  return val;
}
