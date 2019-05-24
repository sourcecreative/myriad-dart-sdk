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

  Future<Response<EarningRuleResponse>> addEarningRule(
      String id, EarningRule rule) {
    final $url = '/campaigns/${id}/earning-rules';
    final $body = rule;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<EarningRuleResponse, EarningRuleResponse>($request);
  }

  Future<Response<EarningRuleResponse>> updateEarningRule(
      String id, String ruleId, EarningRule rule) {
    final $url = '/campaigns/${id}/earning-rules/${ruleId}';
    final $body = rule;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<EarningRuleResponse, EarningRuleResponse>($request);
  }

  Future<Response<void>> removeEarningRule(String id, String ruleId) {
    final $url = '/campaigns/${id}/earning-rules/${ruleId}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<void, void>($request);
  }

  Future<Response<PaginatedEarningRuleResponse>> listEarningRules(String id,
      {int page = 1, int size = 20}) {
    final $url = '/campaigns/${id}/earning-rules';
    final Map<String, dynamic> $params = {'page': page, 'size': size};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<PaginatedEarningRuleResponse,
        PaginatedEarningRuleResponse>($request);
  }

  Future<Response<RewardRuleResponse>> addRewardRule(
      String id, RewardRule rule) {
    final $url = '/campaigns/${id}/reward-rules';
    final $body = rule;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<RewardRuleResponse, RewardRuleResponse>($request);
  }

  Future<Response<RewardRuleResponse>> updateRewardRule(
      String id, String ruleId, EarningRule rule) {
    final $url = '/campaigns/${id}/reward-rules/${ruleId}';
    final $body = rule;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<RewardRuleResponse, RewardRuleResponse>($request);
  }

  Future<Response<void>> removeRewardRule(String id, String ruleId) {
    final $url = '/campaigns/${id}/reward-rules/${ruleId}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<void, void>($request);
  }

  Future<Response<PaginatedRewardRuleResponse>> listRewardRules(String id,
      {int page = 1, int size = 20}) {
    final $url = '/campaigns/${id}/reward-rules';
    final Map<String, dynamic> $params = {'page': page, 'size': size};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<PaginatedRewardRuleResponse,
        PaginatedRewardRuleResponse>($request);
  }

  Future<Response<MembershipResponse>> createMembership(
      String id, Membership membership) {
    final $url = '/campaigns/${id}/memberships';
    final $body = membership;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<MembershipResponse, MembershipResponse>($request);
  }

  Future<Response<MembershipResponse>> findMemberById(
      String id, String membershipId) {
    final $url = '/campaigns/${id}/memberships/${membershipId}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<MembershipResponse, MembershipResponse>($request);
  }

  Future<Response<PaginatedMembershipResponse>> listMemberships(String id,
      {int page = 1, int size = 20}) {
    final $url = '/campaigns/${id}/memberships';
    final Map<String, dynamic> $params = {'page': page, 'size': size};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<PaginatedMembershipResponse,
        PaginatedMembershipResponse>($request);
  }

  Future<Response<MembershipResponse>> addBalance(
      String id, String membershipId, int points) {
    final $url = '/campaigns/${id}/memberships/${membershipId}/balance';
    final $body = points;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<MembershipResponse, MembershipResponse>($request);
  }
}
