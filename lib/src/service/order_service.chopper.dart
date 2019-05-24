// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$OrderService extends OrderService {
  _$OrderService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = OrderService;

  Future<Response<OrderResponse>> create(CreateOrderRequest order) {
    final $url = '/orders/';
    final $body = order;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<OrderResponse, OrderResponse>($request);
  }

  Future<Response<OrderResponse>> findById(String id) {
    final $url = '/orders/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<OrderResponse, OrderResponse>($request);
  }

  Future<Response<PaginatedOrderResponse>> list(
      {Map<String, dynamic> filter = const <String, dynamic>{},
      int page = 1,
      int size = 20}) {
    final $url = '/orders/';
    final Map<String, dynamic> $params = {'page': page, 'size': size};
    $params.addAll(filter);
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client
        .send<PaginatedOrderResponse, PaginatedOrderResponse>($request);
  }

  Future<Response<OrderResponse>> update(String id, Order order) {
    final $url = '/orders/${id}';
    final $body = order;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<OrderResponse, OrderResponse>($request);
  }

  Future<Response<void>> delete(String id) {
    final $url = '/orders/${id}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<void, void>($request);
  }
}
