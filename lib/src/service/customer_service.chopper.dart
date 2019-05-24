// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$CustomerService extends CustomerService {
  _$CustomerService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = CustomerService;

  Future<Response<CustomerResponse>> create(Customer customer) {
    final $url = '/customers/';
    final $body = customer;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<CustomerResponse, CustomerResponse>($request);
  }

  Future<Response<CustomerResponse>> findById(String id) {
    final $url = '/customers/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<CustomerResponse, CustomerResponse>($request);
  }

  Future<Response<PaginatedCustomerResponse>> list(
      {Map<String, dynamic> filter = const <String, dynamic>{},
      int page = 1,
      int size = 20}) {
    final $url = '/customers/';
    final Map<String, dynamic> $params = {'page': page, 'size': size};
    $params.addAll(filter);
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client
        .send<PaginatedCustomerResponse, PaginatedCustomerResponse>($request);
  }

  Future<Response<CustomerResponse>> update(String id, Customer customer) {
    final $url = '/customers/${id}';
    final $body = customer;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<CustomerResponse, CustomerResponse>($request);
  }

  Future<Response<void>> delete(String id) {
    final $url = '/customers/${id}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<void, void>($request);
  }

  Future<Response<BatchUpdateCustomerResponse>> batchUpdate(
      BatchUpdateCustomerRequest customers) {
    final $url = '/customers/';
    final $body = customers;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<BatchUpdateCustomerResponse,
        BatchUpdateCustomerResponse>($request);
  }
}
