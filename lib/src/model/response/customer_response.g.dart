// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CustomerResponse _$CustomerResponseFromJson(Map<String, dynamic> json) {
  return CustomerResponse(json['id'] as String)
    ..objType = json['objType'] as String
    ..sourceId = json['sourceId'] as String
    ..name = json['name'] as String
    ..wallet = json['wallet'] as String
    ..email = json['email'] as String
    ..phone = json['phone'] as String
    ..address = json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>);
}

Map<String, dynamic> _$CustomerResponseToJson(CustomerResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('objType', instance.objType);
  writeNotNull('id', instance.id);
  writeNotNull('sourceId', instance.sourceId);
  writeNotNull('name', instance.name);
  writeNotNull('wallet', instance.wallet);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  writeNotNull('address', instance.address);
  return val;
}
