// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$SegmentService extends SegmentService {
  _$SegmentService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = SegmentService;

  Future<Response<SegmentResponse>> create(Segment segment) {
    final $url = '/orders/';
    final $body = segment;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<SegmentResponse, SegmentResponse>($request);
  }

  Future<Response<SegmentResponse>> findById(String id) {
    final $url = '/orders/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<SegmentResponse, SegmentResponse>($request);
  }

  Future<Response<PaginatedSegmentResponse>> list(
      {Map<String, dynamic> filter = const <String, dynamic>{},
      int page = 1,
      int size = 20}) {
    final $url = '/orders/';
    final Map<String, dynamic> $params = {'page': page, 'size': size};
    $params.addAll(filter);
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client
        .send<PaginatedSegmentResponse, PaginatedSegmentResponse>($request);
  }

  Future<Response<SegmentResponse>> update(String id, Segment segment) {
    final $url = '/orders/${id}';
    final $body = segment;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<SegmentResponse, SegmentResponse>($request);
  }

  Future<Response<void>> delete(String id) {
    final $url = '/orders/${id}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<void, void>($request);
  }
}
