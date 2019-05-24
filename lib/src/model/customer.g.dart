// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(json['city'] as String,
      street: json['street'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      postalCode: json['postalCode'] as String);
}

Map<String, dynamic> _$AddressToJson(Address instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('street', instance.street);
  writeNotNull('city', instance.city);
  writeNotNull('state', instance.state);
  writeNotNull('country', instance.country);
  writeNotNull('postalCode', instance.postalCode);
  return val;
}

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(json['wallet'] as String,
      sourceId: json['sourceId'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>))
    ..metadata = json['metadata'] as Map<String, dynamic>;
}

Map<String, dynamic> _$CustomerToJson(Customer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sourceId', instance.sourceId);
  writeNotNull('name', instance.name);
  writeNotNull('wallet', instance.wallet);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  writeNotNull('address', instance.address);
  writeNotNull('metadata', instance.metadata);
  return val;
}

CustomerResponse _$CustomerResponseFromJson(Map<String, dynamic> json) {
  return CustomerResponse(json['id'] as String)
    ..sourceId = json['sourceId'] as String
    ..name = json['name'] as String
    ..wallet = json['wallet'] as String
    ..email = json['email'] as String
    ..phone = json['phone'] as String
    ..address = json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>)
    ..metadata = json['metadata'] as Map<String, dynamic>;
}

Map<String, dynamic> _$CustomerResponseToJson(CustomerResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('sourceId', instance.sourceId);
  writeNotNull('name', instance.name);
  writeNotNull('wallet', instance.wallet);
  writeNotNull('email', instance.email);
  writeNotNull('phone', instance.phone);
  writeNotNull('address', instance.address);
  writeNotNull('metadata', instance.metadata);
  return val;
}

PaginatedCustomerResponse _$PaginatedCustomerResponseFromJson(
    Map<String, dynamic> json) {
  return PaginatedCustomerResponse(
      (json['entries'] as List)
          ?.map((e) => e == null
              ? null
              : CustomerResponse.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['total'] as int,
      page: json['page'] as int,
      size: json['size'] as int);
}

Map<String, dynamic> _$PaginatedCustomerResponseToJson(
    PaginatedCustomerResponse instance) {
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

BatchUpdateCustomerRequest _$BatchUpdateCustomerRequestFromJson(
    Map<String, dynamic> json) {
  return BatchUpdateCustomerRequest(
      (json['customers'] as List)
          ?.map((e) =>
              e == null ? null : Customer.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      metadata: json['metadata'] as Map<String, dynamic>);
}

Map<String, dynamic> _$BatchUpdateCustomerRequestToJson(
    BatchUpdateCustomerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('metadata', instance.metadata);
  writeNotNull('customers', instance.customers);
  return val;
}

BatchUpdateCustomerResponse _$BatchUpdateCustomerResponseFromJson(
    Map<String, dynamic> json) {
  return BatchUpdateCustomerResponse((json['customers'] as List)
      ?.map((e) => e == null
          ? null
          : CustomerResponse.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$BatchUpdateCustomerResponseToJson(
    BatchUpdateCustomerResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('customers', instance.customers);
  return val;
}
