// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) {
  return OrderResponse(json['id'] as String)
    ..objType = json['objType'] as String
    ..sourceId = json['sourceId'] as String
    ..amount = json['amount'] as int
    ..currency = json['currency'] == null
        ? null
        : Currency.fromJson(json['currency'] as Map<String, dynamic>)
    ..items = (json['items'] as List)
        ?.map((e) =>
            e == null ? null : OrderItem.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..metadata = json['metadata'] as Map<String, dynamic>;
}

Map<String, dynamic> _$OrderResponseToJson(OrderResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('objType', instance.objType);
  writeNotNull('id', instance.id);
  writeNotNull('sourceId', instance.sourceId);
  writeNotNull('amount', instance.amount);
  writeNotNull('currency', instance.currency);
  writeNotNull('items', instance.items);
  writeNotNull('metadata', instance.metadata);
  return val;
}
