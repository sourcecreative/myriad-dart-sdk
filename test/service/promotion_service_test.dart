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

      var resp = await client.tiers.create(tier);
      expect(json.encode(resp.body), equals(jsonResp));
      httpClient.close();
    });
  });

  group('PromotionService', () {
    test('create promotion campaign', () async {
      var rule1 = Rule('order limit','order limit greater than 30', 'order.amount > 30');
      var tier1 = Tier("tier1", [rule1]);
      var campaign = PromotionCampaign('Promotion Campaign', DateTime.parse('2019-05-06'), DateTime.parse('2019-07-08'),
        [tier1], category:'New Customer');
      var jsonCampaign = json.encode(campaign);
      
      var rule1Resp = RuleResponse(Uuid().generateV4(), rule1.name, rule1.description, rule1.condition);
      var tier1Resp = TierResponse(Uuid().generateV4(),tier1.name,[rule1Resp]);
      var expectedCampaign = PromotionCampaignResponse()
        ..id=Uuid().generateV4()
        ..name=campaign.name
        ..type='VOUCHER'
        ..effective=campaign.effective
        ..expiry=campaign.expiry
        ..tiers=[tier1Resp]
        ..status=CampaignStatus.ACTIVE
        ..updatedAt=DateTime.now()
        ..category=campaign.category
        ..metadata=campaign.metadata;      
      var jsonResp = json.encode(expectedCampaign);

      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/promotions/'));
        expect(req.headers['content-type'], 'application/json; charset=utf-8');
        expect(req.body, equals(jsonCampaign));
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
      
      var resp = await client.promotions.create(campaign);
      expect(json.encode(resp.body), equals(jsonResp));
      httpClient.close();
    });

    test("list promotions", () async {
      var campaign1 = PromotionCampaignResponse()
        ..id="dcf9c4d9-1d99-42d0-b4f2-5b631fe54ea1"
        ..name="voucher campaign"
        ..type="VOUCHER"
        ..effective=DateTime.parse("2019-05-03")
        ..expiry=DateTime.parse("2019-05-09")
        ..status=CampaignStatus.ACTIVE
        ..updatedAt=DateTime.parse("2019-06-01")
        ..metadata=<String,dynamic>{}
        ..category="test1";
      var campaign2 = PromotionCampaignResponse()
        ..id="dcf9c4d9-1d99-42d0-b4f2-5b631fe54ea2"
        ..name="promotion campaign"
        ..type="VOUCHER"
        ..effective=DateTime.parse("2019-05-03")
        ..expiry=DateTime.parse("2019-05-09")
        ..status=CampaignStatus.ACTIVE
        ..updatedAt=DateTime.parse("2019-06-01")
        ..metadata=<String,dynamic>{}
        ..category="test2";
      var campaigns = PaginatedPromotionResponse([campaign1,campaign2],2);
      var jsonResp = json.encode(campaigns);
      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/promotions/?page=1&size=20'));
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

      var r = await client.promotions.list();
      expect(json.encode(r.body), equals(jsonResp));
      httpClient.close();
    });


  });
}