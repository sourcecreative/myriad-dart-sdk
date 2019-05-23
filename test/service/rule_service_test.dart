import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:usage/uuid/uuid.dart';
import 'dart:convert';
import 'package:myriad_dart_sdk/myriad_dart_sdk.dart';

void main() async {
  group('RuleService.create', () {
    test('create a validation rule', () async {
      // request object
      var rule = Rule('order amount limitation', 'order amount greater than 100', 'order.amount > 100');
      var jsonReq = json.encode(rule);
      var expectedResp = RuleResponse(
        Uuid().generateV4(),
        'order amount limitation', 'order amount greater than 100', 'order.amount > 100'
      );
      var jsonResp = json.encode(expectedResp);

      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/rules/'));
        expect(req.headers['content-type'], 'application/json; charset=utf-8');
        expect(req.body, equals(jsonReq));
        return http.Response(
          jsonResp,
          200,
          headers: {'content-type': 'application/json; charset=utf-8'},
        );
      });
      
      var client = MyriadClient.build(
        ConnectionOptions("https://api.sourcecreative.io", appId:'appid',appSecret:'appkey'),
        httpClient: httpClient
      );

      var resp = await client.rules.create(rule);
      expect(json.encode(resp.body), equals(jsonResp));
      httpClient.close();
    });
  });
}