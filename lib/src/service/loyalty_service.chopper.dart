// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loyalty_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$LoyaltyService extends LoyaltyService {
  _$LoyaltyService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = LoyaltyService;

  Future<Response<LoyaltyProgramResponse>> create(LoyaltyProgram campaign) {
    final $url = '/campaigns/';
    final $body = campaign;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client
        .send<LoyaltyProgramResponse, LoyaltyProgramResponse>($request);
  }

  Future<Response<LoyaltyProgramResponse>> findById(String id) {
    final $url = '/campaigns/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client
        .send<LoyaltyProgramResponse, LoyaltyProgramResponse>($request);
  }

  Future<Response<PaginatedLoyaltyResponse>> list(
      {Map<String, dynamic> filter = const <String, dynamic>{},
      int page = 1,
      int size = 20}) {
    final $url = '/campaigns/';
    final Map<String, dynamic> $params = {'page': page, 'size': size};
    $params.addAll(filter);
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client
        .send<PaginatedLoyaltyResponse, PaginatedLoyaltyResponse>($request);
  }

  Future<Response<LoyaltyProgramResponse>> update(
      String id, UpdateCampaign campaign) {
    final $url = '/campaigns/${id}';
    final $body = campaign;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client
        .send<LoyaltyProgramResponse, LoyaltyProgramResponse>($request);
  }

  Future<Response<void>> delete(String id) {
    final $url = '/campaigns/${id}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<void, void>($request);
  }

  Future<Response<RuleResponse>> addRule(String id, Rule rule) {
    final $url = '/campaigns/${id}/rules';
    final $body = rule;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<RuleResponse, RuleResponse>($request);
  }

  Future<Response<RuleResponse>> updateRule(
      String id, String ruleId, Rule rule) {
    final $url = '/campaigns/${id}/rules/${ruleId}';
    final $body = rule;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<RuleResponse, RuleResponse>($request);
  }

  Future<Response<void>> removeRule(String id, String ruleId) {
    final $url = '/campaigns/${id}/rules/${ruleId}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<void, void>($request);
  }
}
