import 'package:json_annotation/json_annotation.dart';

import '../customer.dart';
import 'response.dart';

part 'customer_response.g.dart';

@JsonSerializable(includeIfNull: false)
class CustomerResponse extends TypedResponse {
  String id;
  String sourceId;
  String name;
  String wallet;
  String email;
  String phone;
  Address address;

  CustomerResponse(this.id) : super('CustomerResponse');

  factory CustomerResponse.fromJson(Map<String, dynamic> json) => _$CustomerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$CustomerResponseFromJson;
}