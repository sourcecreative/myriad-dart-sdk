// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voucher_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$VoucherService extends VoucherService {
  _$VoucherService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = VoucherService;

  Future<Response<VoucherResponse>> create(Voucher<VoucherConfig> voucher) {
    final $url = '/vouchers/';
    final $body = voucher;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<VoucherResponse, VoucherResponse>($request);
  }

  Future<Response<VoucherResponse>> findById(String id) {
    final $url = '/vouchers/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<VoucherResponse, VoucherResponse>($request);
  }

  Future<Response<PaginatedVoucherResponse>> list(
      {int page = 1, int size = 20}) {
    final $url = '/vouchers/';
    final Map<String, dynamic> $params = {'page': page, 'size': size};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client
        .send<PaginatedVoucherResponse, PaginatedVoucherResponse>($request);
  }

  Future<Response<VoucherResponse>> update(String id, UpdateVoucher campaign) {
    final $url = '/vouchers/${id}';
    final $body = campaign;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<VoucherResponse, VoucherResponse>($request);
  }

  Future<Response<VoucherResponse>> enable(String id, bool enabled) {
    final $url = '/vouchers/${id}';
    final $body = enabled;
    final $request = Request('PATCH', $url, client.baseUrl, body: $body);
    return client.send<VoucherResponse, VoucherResponse>($request);
  }

  Future<Response<void>> delete(String id) {
    final $url = '/vouchers/${id}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<void, void>($request);
  }

  Future<Response<ImportVoucherResponse>> import(
      List<Voucher<VoucherConfig>> voucher) {
    final $url = '/vouchers/import';
    final $body = voucher;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ImportVoucherResponse, ImportVoucherResponse>($request);
  }

  Future<Response<VoucherDistributionResponse>> distribute(
      String id, DistributeVoucher distribution) {
    final $url = '/vouchers/${id}/distributions';
    final $body = distribution;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<VoucherDistributionResponse,
        VoucherDistributionResponse>($request);
  }
}
