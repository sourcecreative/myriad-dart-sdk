// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$TierService extends TierService {
  _$TierService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = TierService;

  Future<Response<TierResponse>> create(Tier tier) {
    final $url = '/tiers/';
    final $body = tier;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<TierResponse, TierResponse>($request);
  }

  Future<Response<TierResponse>> findById(String id) {
    final $url = '/tiers/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<TierResponse, TierResponse>($request);
  }

  Future<Response<TierResponse>> update(String id, Tier tier) {
    final $url = '/tiers/${id}';
    final $body = tier;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<TierResponse, TierResponse>($request);
  }

  Future<Response<void>> delete(String id) {
    final $url = '/tiers/${id}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<void, void>($request);
  }

  Future<Response<PaginatedTierResponse>> list(
      {Map<String, dynamic> filter = const <String, dynamic>{},
      int page = 1,
      int size = 20}) {
    final $url = '/tiers/';
    final Map<String, dynamic> $params = {'page': page, 'size': size};
    $params.addAll(filter);
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<PaginatedTierResponse, PaginatedTierResponse>($request);
  }
}