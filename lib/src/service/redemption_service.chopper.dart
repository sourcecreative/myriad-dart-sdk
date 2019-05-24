// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'redemption_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$RedemptionService extends RedemptionService {
  _$RedemptionService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = RedemptionService;

  Future<Response<VoucherValidationResponse>> validateVoucher(
      VoucherValidation validation) {
    final $url = '/redemptions/';
    final $body = validation;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client
        .send<VoucherValidationResponse, VoucherValidationResponse>($request);
  }

  Future<Response<PromotionValidationResponse>> validatePromotion(
      Validation validation) {
    final $url = '/redemptions/';
    final $body = validation;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<PromotionValidationResponse,
        PromotionValidationResponse>($request);
  }

  Future<Response<VoucherRedemptionResponse>> redeemCoupon(
      CouponRedemption redemption) {
    final $url = '/redemptions/';
    final $body = redemption;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client
        .send<VoucherRedemptionResponse, VoucherRedemptionResponse>($request);
  }

  Future<Response<PromotionRedemptionResponse>> redeemPromotion(
      PromotionRedemption redemption) {
    final $url = '/redemptions/';
    final $body = redemption;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<PromotionRedemptionResponse,
        PromotionRedemptionResponse>($request);
  }
}
