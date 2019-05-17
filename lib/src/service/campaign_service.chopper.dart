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

  Future<Response<CampaignResponse>> create(Campaign campaign) {
    final $url = '/campaigns/';
    final $body = campaign;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<CampaignResponse, CampaignResponse>($request);
  }

  Future<Response<CampaignResponse>> findById(String id) {
    final $url = '/campaigns/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<CampaignResponse, CampaignResponse>($request);
  }

  Future<Response<PaginatedCampaignResponse>> list(
      {dynamic filter = null, int page = 1, int size = 20}) {
    final $url = '/campaigns/';
    final Map<String, dynamic> $params = {'page': page, 'size': size};
    $params.addAll(filter);
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client
        .send<PaginatedCampaignResponse, PaginatedCampaignResponse>($request);
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

  Future<Response<ImportVoucherResponse>> importVouchers(
      String id, List<Voucher<VoucherConfig>> voucher) {
    final $url = '/campaigns/${id}/vouchers/import';
    final $body = voucher;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ImportVoucherResponse, ImportVoucherResponse>($request);
  }

  Future<Response<CampaignResponse>> attachRules(String id, Set<Rule> rules) {
    final $url = '/campaigns/${id}/rules';
    final $body = rules;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<CampaignResponse, CampaignResponse>($request);
  }

  Future<Response<CampaignResponse>> detachRules(String id) {
    final $url = '/campaigns/${id}/rules';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<CampaignResponse, CampaignResponse>($request);
  }

  Future<Response<CampaignResponse>> detachRule(String id, String ruleId) {
    final $url = '/campaigns/${id}/rules/${ruleId}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<CampaignResponse, CampaignResponse>($request);
  }
}
