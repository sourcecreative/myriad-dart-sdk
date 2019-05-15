// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$CampaignService extends CampaignService {
  _$CampaignService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = CampaignService;

  Future<Response<VoucherCampaignResponse>> create(
      VoucherCampaign<VoucherConfig> campaign) {
    final $url = '/campaigns/';
    final $body = campaign;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client
        .send<VoucherCampaignResponse, VoucherCampaignResponse>($request);
  }

  Future<Response<CampaignResponse>> findById(String id) {
    final $url = '/campaigns/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<CampaignResponse, CampaignResponse>($request);
  }

  Future<Response<PaginatedCampaignsResponse>> list(
      {int page = 1, int size = 20}) {
    final $url = '/campaigns/';
    final Map<String, dynamic> $params = {'page': page, 'size': size};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client
        .send<PaginatedCampaignsResponse, PaginatedCampaignsResponse>($request);
  }

  Future<Response<CampaignResponse>> update(
      String id, UpdateCampaign campaign) {
    final $url = '/campaigns/${id}';
    final $body = campaign;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<CampaignResponse, CampaignResponse>($request);
  }

  Future<Response<void>> delete(String id) {
    final $url = '/campaigns/${id}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<void, void>($request);
  }
}
