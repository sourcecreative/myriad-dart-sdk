// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$RuleService extends RuleService {
  _$RuleService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = RuleService;

  Future<Response<RuleResponse>> create(Rule tier) {
    final $url = '/rules/';
    final $body = tier;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<RuleResponse, RuleResponse>($request);
  }

  Future<Response<RuleResponse>> findById(String id) {
    final $url = '/rules/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<RuleResponse, RuleResponse>($request);
  }

  Future<Response<RuleResponse>> update(String id, Rule tier) {
    final $url = '/rules/${id}';
    final $body = tier;
    final $request = Request('PUT', $url, client.baseUrl, body: $body);
    return client.send<RuleResponse, RuleResponse>($request);
  }

  Future<Response<void>> delete(String id) {
    final $url = '/rules/${id}';
    final $request = Request('DELETE', $url, client.baseUrl);
    return client.send<void, void>($request);
  }

  Future<Response<PaginatedRuleResponse>> list(
      {Map<String, dynamic> filter = const <String, dynamic>{},
      int page = 1,
      int size = 20}) {
    final $url = '/rules/';
    final Map<String, dynamic> $params = {'page': page, 'size': size};
    $params.addAll(filter);
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<PaginatedRuleResponse, PaginatedRuleResponse>($request);
  }

  Future<Response<RuleAssignmentResponse>> assign(
      String id, RuleAssignment assignment) {
    final $url = '/rules/${id}/assignments';
    final $body = assignment;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client
        .send<RuleAssignmentResponse, RuleAssignmentResponse>($request);
  }
}
