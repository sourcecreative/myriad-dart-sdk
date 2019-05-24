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

  Future<Response<VoucherCampaignResponse>> findById(String id) {
    final $url = '/campaigns/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client
        .send<VoucherCampaignResponse, VoucherCampaignResponse>($request);
  }

  Future<Response<PaginatedCampaignResponse>> list(
      {Map<String, dynamic> filter = const <String, dynamic>{},
      int page = 1,
      int size = 20}) {
    final $url = '/campaigns/';
    final Map<String, dynamic> $params = {'page': page, 'size': size};
    $params.addAll(filter);
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client
        .send<PaginatedCampaignResponse, PaginatedCampaignResponse>($request);
  }

  Future<Response<VoucherCampaignResponse>> update(
      String id, UpdateCampaign campaign) {
    final $url = '/campaigns/${id}';
    final $body = campaign;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client
        .send<VoucherCampaignResponse, VoucherCampaignResponse>($request);
  }

  Future<Response<void>> delete(String id) {
    final $url = '/campaigns/${id}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<void, void>($request);
  }

  Future<Response<VoucherResponse>> addVoucher(
      String id, Voucher<VoucherConfig> voucher) {
    final $url = '/campaigns/${id}/vouchers';
    final $body = voucher;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<VoucherResponse, VoucherResponse>($request);
  }

  Future<Response<ImportVoucherResponse>> importVouchers(
      String id, List<Voucher<VoucherConfig>> voucher) {
    final $url = '/campaigns/${id}/vouchers/import';
    final $body = voucher;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ImportVoucherResponse, ImportVoucherResponse>($request);
  }

  Future<Response<PaginatedVoucherDistributionResponse>> listDistributions(
      String id,
      {int page = 1,
      int size = 20}) {
    final $url = '/campaigns/${id}/distributions';
    final Map<String, dynamic> $params = {'page': page, 'size': size};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<PaginatedVoucherDistributionResponse,
        PaginatedVoucherDistributionResponse>($request);
  }

  Future<Response<VoucherDistributionResponse>> distribute(
      String id, DistributeVoucher distribution) {
    final $url = '/campaigns/${id}/distributions';
    final $body = distribution;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<VoucherDistributionResponse,
        VoucherDistributionResponse>($request);
  }

  Future<Response<DistributeBatchVouchersResponse>> distributeVouchers(
      String id, DistributeBatchVouchers distributions) {
    final $url = '/campaigns/${id}/distributions';
    final $body = distributions;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<DistributeBatchVouchersResponse,
        DistributeBatchVouchersResponse>($request);
  }
}
