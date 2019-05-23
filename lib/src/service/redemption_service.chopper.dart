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

  Future<Response<ValidationResponse>> validate(Validation validation) {
    final $url = '/redemptions/';
    final $body = validation;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<ValidationResponse, ValidationResponse>($request);
  }

  Future<Response<RedemptionResponse>> redeem(Redemption redemption) {
    final $url = '/redemptions/';
    final $body = redemption;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<RedemptionResponse, RedemptionResponse>($request);
  }
}
