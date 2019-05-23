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

class _$PromotionService extends PromotionService {
  _$PromotionService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = PromotionService;

  Future<Response<PromotionCampaignResponse>> create(
      PromotionCampaign campaign) {
    final $url = '/promotions/';
    final $body = campaign;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client
        .send<PromotionCampaignResponse, PromotionCampaignResponse>($request);
  }

  Future<Response<PromotionCampaignResponse>> findById(String id) {
    final $url = '/promotions/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client
        .send<PromotionCampaignResponse, PromotionCampaignResponse>($request);
  }

  Future<Response<PaginatedPromotionResponse>> list(
      {Map<String, dynamic> filter = const <String, dynamic>{},
      int page = 1,
      int size = 20}) {
    final $url = '/promotions/';
    final Map<String, dynamic> $params = {'page': page, 'size': size};
    $params.addAll(filter);
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client
        .send<PaginatedPromotionResponse, PaginatedPromotionResponse>($request);
  }

  Future<Response<PromotionCampaignResponse>> update(
      String id, UpdateCampaign campaign) {
    final $url = '/promotions/${id}';
    final $body = campaign;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client
        .send<PromotionCampaignResponse, PromotionCampaignResponse>($request);
  }

  Future<Response<void>> delete(String id) {
    final $url = '/promotions/${id}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<void, void>($request);
  }

  Future<Response<TierResponse>> addTier(String id, Tier tier) {
    final $url = '/promotions/${id}/tiers';
    final $body = tier;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<TierResponse, TierResponse>($request);
  }

  Future<Response<TierResponse>> updateTier(
      String id, String tierId, Tier tier) {
    final $url = '/promotions/${id}/tiers/${tierId}';
    final $body = tier;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<TierResponse, TierResponse>($request);
  }

  Future<Response<void>> removeTier(String id, String tierId) {
    final $url = '/promotions/${id}/tiers/${tierId}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<void, void>($request);
  }
}
