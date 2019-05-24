import 'package:json_annotation/json_annotation.dart';
import 'package:myriad_dart_sdk/src/model/paginated_response.dart';
import 'package:quiver/core.dart';

part 'customer.g.dart';

@JsonSerializable(includeIfNull: false)
class Address {
  String street;
  String city;
  String state;
  String country;
  String postalCode;

  Address(this.city,{this.street, this.state, this.country, this.postalCode});

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);

  bool operator == (o) => o is Address && o.city == city && o.street == street 
    && o.state == state && o.country == country && o.postalCode == postalCode;
  int get hashCode => hashObjects([city,street,state,country,postalCode]);
}

@JsonSerializable(includeIfNull: false)
class Customer {
  String sourceId;
  String name;
  String wallet;
  String email;
  String phone;
  Address address;
  Map<String,dynamic> metadata;

  Customer(this.wallet,{this.sourceId,this.name, this.email, this.phone, this.address});

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerToJson(this);

  bool operator == (o) => o is Customer && o.wallet == wallet && o.sourceId == sourceId 
    && o.name == name && o.email == email && o.phone == phone && o.address == address;
  int get hashCode => hashObjects([wallet,sourceId,name,email,phone,address]);

}

@JsonSerializable(includeIfNull: false)
class CustomerResponse {
  String id;
  String sourceId;
  String name;
  String wallet;
  String email;
  String phone;
  Address address;
  Map<String,dynamic> metadata;

  CustomerResponse(this.id);

  factory CustomerResponse.fromJson(Map<String, dynamic> json) => _$CustomerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$CustomerResponseFromJson;
}

@JsonSerializable(includeIfNull: false)
class PaginatedCustomerResponse extends PaginatedResponse<CustomerResponse> {
  PaginatedCustomerResponse(List<CustomerResponse> entries, int total, { int page=1, int size=20}) 
    : super(entries, total, page:page, size:size);

 factory PaginatedCustomerResponse.fromJson(Map<String, dynamic> json) => _$PaginatedCustomerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedCustomerResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$PaginatedCustomerResponseFromJson;

}

@JsonSerializable(includeIfNull: false)
class BatchUpdateCustomerRequest {
  // metadata for all customers
  Map<String,dynamic> metadata;
  List<Customer> customers;

  BatchUpdateCustomerRequest(List<Customer> customers,{this.metadata=const<String,dynamic>{}});

  factory BatchUpdateCustomerRequest.fromJson(Map<String, dynamic> json) => _$BatchUpdateCustomerRequestFromJson(json);
  Map<String, dynamic> toJson() => _$BatchUpdateCustomerRequestToJson(this);

}

@JsonSerializable(includeIfNull: false)
class BatchUpdateCustomerResponse {
  List<CustomerResponse> customers;

  BatchUpdateCustomerResponse(this.customers);

  factory BatchUpdateCustomerResponse.fromJson(Map<String, dynamic> json) => _$BatchUpdateCustomerResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BatchUpdateCustomerResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$BatchUpdateCustomerResponseFromJson;

}