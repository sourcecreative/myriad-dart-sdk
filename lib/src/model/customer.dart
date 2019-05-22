import 'package:json_annotation/json_annotation.dart';
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

  Customer(this.wallet,{this.sourceId,this.name, this.email, this.phone, this.address});

  factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerToJson(this);

  bool operator == (o) => o is Customer && o.wallet == wallet && o.sourceId == sourceId 
    && o.name == name && o.email == email && o.phone == phone && o.address == address;
  int get hashCode => hashObjects([wallet,sourceId,name,email,phone,address]);

}