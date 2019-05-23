import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:usage/uuid/uuid.dart';
import 'dart:convert';
import 'package:myriad_dart_sdk/myriad_sdk.dart';

void main() async {
  group('TierService.create', () {
    test('create a promotion tier', () async {
      // request object
      var tier = Tier('tier1',<Rule>[
        Rule('order amount limitation', 'order amount greater than 100', 'order.amount > 100'),
        Rule('new customer','new customer','customer.segment == "New Customer"')
      ]);
      var jsonReq = json.encode(tier);
      var expectedResp = TierResponse(
        Uuid().generateV4(),
        tier.name,
        <RuleResponse>[
          RuleResponse(Uuid().generateV4(),'order amount limitation', 'order amount greater than 100', 'order.amount > 100'),
          RuleResponse(Uuid().generateV4(),'new customer','new customer','customer.segment == "New Customer"')
        ]
      );
      var jsonResp = json.encode(expectedResp);

      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/tiers/'));
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

      var resp = await client.promotions.create(tier);
      expect(json.encode(resp.body), equals(jsonResp));
      httpClient.close();
    });
  });
}