import 'package:chopper/chopper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:usage/uuid/uuid.dart';
import 'dart:convert';

import 'package:myriad_dart_sdk/myriad_dart_sdk.dart';

void main() async {
  group('CampaignService.create', () {

    var campaign = VoucherCampaign('Gift Campaign', DateTime.parse('2019-05-06'), DateTime.parse('2019-07-08'),
      1000, GiftConfig(CodeConfig(length:10,charset:CodeConfig.ALPHABETIC), 'iPad'));

    var campaignResponse = VoucherCampaignResponse()
      ..id=Uuid().generateV4()
      ..name=campaign.name
      ..type='VOUCHER'
      ..effective=campaign.effective
      ..expiry=campaign.expiry
      ..autoUpdate=campaign.autoUpdate
      ..config=campaign.config 
      ..rules=<RuleResponse>[]
      ..status=CampaignStatus.PENDING
      ..updatedAt=DateTime.parse('2019-05-06')
      ..metadata=campaign.metadata;
  
    var jsonReq = json.encode(campaign);
    var jsonResp = json.encode(campaignResponse);

    test('returns 500', () async {
      final err500 = MyriadError(500, "Internal Server Error");

      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/campaigns/'));
        expect(req.headers['content-type'], 'application/json; charset=utf-8');
        expect(req.body, equals(jsonReq));
        return http.Response(
          json.encode(err500),
          500,
          headers: {'content-type': 'application/json; charset=utf-8'},
        );
      });
      
      final client = MyriadClient.build(
        ConnectionOptions("https://api.sourcecreative.io", appId:'appid',appSecret:'appkey'),
        httpClient: httpClient
      );
      
      var result = client.campaigns.create(campaign);
      expect(result, throwsA(isInstanceOf<Response<MyriadError>>()));
      httpClient.close();
    });

    test('create gift campaign', () async {
      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/campaigns/'));
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
      
      var resp = await client.campaigns.create(campaign);
      expect(json.encode(resp.body), equals(jsonResp));
      httpClient.close();
    });

    test('create coupon campaign', () async {
      var couponCampaign = VoucherCampaign('Coupon Campaign', DateTime.parse('2019-05-06'), DateTime.parse('2019-07-08'),
        1000, CouponConfig(CodeConfig(length:10,charset:CodeConfig.ALPHABETIC), AmountDiscount(10)));
      var jsonCampaign = json.encode(couponCampaign);

      var expectedResponse = VoucherCampaignResponse()
        ..id=Uuid().generateV4()
        ..name=couponCampaign.name
        ..type='VOUCHER'
        ..effective=couponCampaign.effective
        ..expiry=couponCampaign.expiry
        ..autoUpdate=couponCampaign.autoUpdate
        ..config=couponCampaign.config 
        ..rules=<RuleResponse>[]
        ..status=CampaignStatus.PENDING
        ..updatedAt=DateTime.now()
        ..metadata=couponCampaign.metadata;      
      var jsonResponse = json.encode(expectedResponse);

      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/campaigns/'));
        expect(req.headers['content-type'], equals('application/json; charset=utf-8'));
        expect(req.body, equals(jsonCampaign));
        return http.Response(
          jsonResponse,
          200,
          headers: {'content-type': 'application/json; charset=utf-8'},
        );
      });

      var client = MyriadClient.build(
        ConnectionOptions("https://api.sourcecreative.io", appId:'appid',appSecret:'appkey'),
        httpClient: httpClient
      );

      Response result = await client.campaigns.create(couponCampaign);
      expect(json.encode(result.body), equals(jsonResponse));
      httpClient.close();
    });

    test('create prepaidcard campaign', () async {
      var campaign = VoucherCampaign('PrepaidCard Campaign', DateTime.parse('2019-05-06'), DateTime.parse('2019-07-08'),
        1000, PrepaidCardConfig(CodeConfig(length:10,charset:CodeConfig.ALPHABETIC), 100));
      var jsonCampaign = json.encode(campaign);

      var expectedResponse = VoucherCampaignResponse()
        ..id=Uuid().generateV4()
        ..name=campaign.name
        ..type='VOUCHER'
        ..effective=campaign.effective
        ..expiry=campaign.expiry
        ..autoUpdate=campaign.autoUpdate
        ..config=campaign.config 
        ..rules=<RuleResponse>[]
        ..status=CampaignStatus.PENDING
        ..updatedAt=DateTime.now()
        ..metadata=campaign.metadata;      
      var jsonResponse = json.encode(expectedResponse);
     
      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/campaigns/'));
        expect(req.headers['content-type'], 'application/json; charset=utf-8');
        expect(req.body, equals(jsonCampaign));
        return http.Response(
          jsonResponse,
          200,
          headers: {'content-type': 'application/json; charset=utf-8'},
        );
      });

      var client = MyriadClient.build(
        ConnectionOptions("https://api.sourcecreative.io", appId:'appid',appSecret:'appkey'),
        httpClient: httpClient
      );
      
      var r = await client.campaigns.create(campaign);
      expect(json.encode(r.body), equals(jsonResponse));
      httpClient.close();
    });

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
        expect(req.url.toString(), equals('https://api.sourcecreative.io/campaigns/'));
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
      
      var resp = await client.campaigns.create(campaign);
      expect(json.encode(resp.body), equals(jsonResp));
      httpClient.close();
    });

  });

  group("CampaignService.findById",() {
    test("success", () async {
      var resp = CampaignResponse("VoucherCampaign")
        ..id="dcf9c4d9-1d99-42d0-b4f2-5b631fe54ea2"
        ..name="campaign name"
        ..type="VOUCHER"
        ..effective=DateTime.parse("2019-05-03")
        ..expiry=DateTime.parse("2019-05-09")
        ..status=CampaignStatus.ACTIVE
        ..updatedAt=DateTime.parse("2019-06-01")
        ..metadata=<String,dynamic>{}
        ..category="test update";
      var jsonResp = json.encode(resp);
      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/campaigns/dcf9c4d9-1d99-42d0-b4f2-5b631fe54ea2'));
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

      var r = await client.campaigns.findById("dcf9c4d9-1d99-42d0-b4f2-5b631fe54ea2");
      expect(json.encode(r.body), equals(jsonResp));
      httpClient.close();
    });

    test("campaign not found (404)", () async {
      var errorResp = MyriadError(404, "Campaign Not Found");
      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/campaigns/dcf9c4d9-1d99-42d0-b4f2-5b631fe54ea2'));
        return http.Response(
          json.encode(errorResp),
          404,
          headers: {'content-type': 'application/json; charset=utf-8'},
        );
      });

      var client = MyriadClient.build(
        ConnectionOptions("https://api.sourcecreative.io", appId:'appid',appSecret:'appkey'),
        httpClient: httpClient
      );

      var r = client.campaigns.findById("dcf9c4d9-1d99-42d0-b4f2-5b631fe54ea2");
      expect(r, throwsA(predicate((e) => e is Response<MyriadError> && e.body.errorCode == 404)));
      httpClient.close();
    });

  });

  group("CampaignService.update", (){
    test("success", () async {
      var updateReq = UpdateCampaign(description: "test update", 
        metadata: <String,dynamic>{"locale":"en_GB"});
      var jsonReq = json.encode(updateReq);
      var updateResp = CampaignResponse('VoucherCampaign')
        ..id="dcf9c4d9-1d99-42d0-b4f2-5b631fe54ea2"
        ..name="campaign name"
        ..type="VOUCHER"
        ..effective=DateTime.parse("2019-05-03")
        ..expiry=DateTime.parse("2019-05-09")
        ..status=CampaignStatus.ACTIVE
        ..updatedAt=DateTime.parse("2019-06-01")
        ..metadata=<String,dynamic>{}
        ..category="test update";
      var jsonResp = json.encode(updateResp);

      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/campaigns/dcf9c4d9-1d99-42d0-b4f2-5b631fe54ea2'));
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

      var r = await client.campaigns.update("dcf9c4d9-1d99-42d0-b4f2-5b631fe54ea2",updateReq);
      expect(json.encode(r.body), equals(jsonResp));
      httpClient.close();
    });

  });

  group("CampaignService.delete", (){
    test("success", () async {
      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/campaigns/dcf9c4d9-1d99-42d0-b4f2-5b631fe54ea2'));
        return http.Response(
          "",
          200,
          headers: {'content-type': 'application/json; charset=utf-8'},
        );
      });

      var client = MyriadClient.build(
        ConnectionOptions("https://api.sourcecreative.io", appId:'appid',appSecret:'appkey'),
        httpClient: httpClient
      );

      Response<void> r = await client.campaigns.delete("dcf9c4d9-1d99-42d0-b4f2-5b631fe54ea2");
      expect(r.isSuccessful, isTrue);
      httpClient.close();
    });

  });

  group("CampaignService.findAll",() {
    test("success", () async {
      var campaign1 = CampaignResponse('VoucherCampaign')
        ..id="dcf9c4d9-1d99-42d0-b4f2-5b631fe54ea1"
        ..name="campaign name"
        ..type="VOUCHER"
        ..effective=DateTime.parse("2019-05-03")
        ..expiry=DateTime.parse("2019-05-09")
        ..status=CampaignStatus.ACTIVE
        ..updatedAt=DateTime.parse("2019-06-01")
        ..metadata=<String,dynamic>{}
        ..category="test1";
      var campaign2 = CampaignResponse('VoucherCampaign')
        ..id="dcf9c4d9-1d99-42d0-b4f2-5b631fe54ea2"
        ..name="campaign name"
        ..type="VOUCHER"
        ..effective=DateTime.parse("2019-05-03")
        ..expiry=DateTime.parse("2019-05-09")
        ..status=CampaignStatus.ACTIVE
        ..updatedAt=DateTime.parse("2019-06-01")
        ..metadata=<String,dynamic>{}
        ..category="test2";
      var campaigns = PaginatedCampaignsResponse([campaign1,campaign2],2);
      var jsonResp = json.encode(campaigns);
      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/campaigns/?page=1&size=20'));
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

      var r = await client.campaigns.list();
      expect(json.encode(r.body), equals(jsonResp));
      httpClient.close();
    });
  });


}
