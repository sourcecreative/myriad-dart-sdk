import 'package:chopper/chopper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:usage/uuid/uuid.dart';
import 'dart:convert';

import 'package:myriad_dart_sdk/myriad_dart_sdk.dart';

void main() async {
  group('Campaign.CreateCampaign', () {

    var campaign = VoucherCampaign('Gift Campaign', DateTime.parse('2019-05-06'), DateTime.parse('2019-07-08'),
      1000, GiftConfig(CodeConfig(length:10,charset:CodeConfig.ALPHABETIC), 'iPad'));

    var campaignResponse = VoucherCampaignResponse(Uuid().generateV4(), campaign.name, 'VOUCHER', campaign.effective, 
      campaign.expiry, campaign.autoUpdate, campaign.config, 
      <RuleResponse>[],//campaign.rules?.map((r)=>RuleResponse('uuid',r.name, r.description, r.condition)), 
      campaign.metadata, CampaignStatus.PENDING, DateTime.parse('2019-05-06'));
  
    var jsonReq = json.encode(campaign);
    var jsonResp = json.encode(campaignResponse);

    test('returns 500', () async {
      final err500 = MyriadError(500, "Internal Server Error");

      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/campaigns'));
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
      
      var result = client.campaigns.createCampaign(campaign);
      expect(result, throwsA(isInstanceOf<Response<MyriadError>>()));
      httpClient.close();
    });

    test('create gift campaign', () async {
      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/campaigns'));
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
      
      var resp = await client.campaigns.createCampaign(campaign);
      expect(json.encode(resp.body), equals(jsonResp));
      httpClient.close();
    });

    test('create coupon campaign', () async {
      var couponCampaign = VoucherCampaign('Coupon Campaign', DateTime.parse('2019-05-06'), DateTime.parse('2019-07-08'),
        1000, CouponConfig(CodeConfig(length:10,charset:CodeConfig.ALPHABETIC), AmountDiscount(10)));
      var jsonCampaign = json.encode(couponCampaign);

      var expectedResponse = VoucherCampaignResponse(Uuid().generateV4(), couponCampaign.name, 'VOUCHER', couponCampaign.effective, 
        couponCampaign.expiry, couponCampaign.autoUpdate, couponCampaign.config, 
        <RuleResponse>[],//campaign.rules?.map((r)=>RuleResponse('uuid',r.name, r.description, r.condition)), 
        couponCampaign.metadata, CampaignStatus.PENDING, DateTime.parse('2019-05-06'));
      var jsonResponse = json.encode(expectedResponse);

      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/campaigns'));
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

      Response result = await client.campaigns.createCampaign(couponCampaign);
      expect(json.encode(result.body), equals(jsonResponse));
      httpClient.close();
    });

    test('create prepaidcard campaign', () async {
      var campaign = VoucherCampaign('PrepaidCard Campaign', DateTime.parse('2019-05-06'), DateTime.parse('2019-07-08'),
        1000, PrepaidCardConfig(CodeConfig(length:10,charset:CodeConfig.ALPHABETIC), 100));
      var jsonCampaign = json.encode(campaign);

      var expectedResponse = VoucherCampaignResponse(Uuid().generateV4(), campaign.name, 'VOUCHER', campaign.effective, 
        campaign.expiry, campaign.autoUpdate, campaign.config, 
        <RuleResponse>[],//campaign.rules?.map((r)=>RuleResponse('uuid',r.name, r.description, r.condition)), 
        campaign.metadata, CampaignStatus.PENDING, DateTime.now());
      var jsonResponse3 = json.encode(expectedResponse);
     
      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/campaigns'));
        expect(req.headers['content-type'], 'application/json; charset=utf-8');
        expect(req.body, equals(jsonCampaign));
        return http.Response(
          jsonResponse3,
          200,
          headers: {'content-type': 'application/json; charset=utf-8'},
        );
      });

      var client = MyriadClient.build(
        ConnectionOptions("https://api.sourcecreative.io", appId:'appid',appSecret:'appkey'),
        httpClient: httpClient
      );
      
      var r = await client.campaigns.createCampaign(campaign);
      expect(json.encode(r.body), equals(jsonResponse3));
      httpClient.close();
    });
  });
}
