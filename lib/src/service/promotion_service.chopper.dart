// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$PromotionService extends PromotionService {
  _$PromotionService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = PromotionService;

  Future<Response<CampaignResponse>> create(PromotionCampaign promotion) {
    final $url = '/promotions/';
    final $body = promotion;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<CampaignResponse, CampaignResponse>($request);
  }

  Future<Response<CampaignResponse>> addTiers(String id, List<Tier> tiers) {
    final $url = '/promotions/${id}/tiers';
    final $body = tiers;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<CampaignResponse, CampaignResponse>($request);
  }

  Future<Response<CampaignResponse>> removeTiers(String id, List<Tier> tiers) {
    final $url = '/promotions/${id}/tiers';
    final $body = tiers;
    final $request = Request('DELETE', $url, client.baseUrl, body: $body);
    return client.send<CampaignResponse, CampaignResponse>($request);
  }
}
