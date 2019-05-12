import 'package:chopper/chopper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'dart:convert';

import 'package:myriad_dart_sdk/myriad_dart_sdk.dart';

void main() {

  final campaign = VoucherCampaign('Gift Campaign', DateTime.parse('2019-05-06'), DateTime.parse('2019-07-08'),
    1000, GiftConfig(CodeConfig(length:10,charset:CodeConfig.ALPHABETIC), 'iPad'));

  final expectedResponse = VoucherCampaignResponse('uuid', campaign.name, 'VOUCHER', campaign.effective, 
    campaign.expiry, campaign.autoUpdate, campaign.config, 
    <RuleResponse>[],//campaign.rules?.map((r)=>RuleResponse('uuid',r.name, r.description, r.condition)), 
    campaign.metadata, CampaignStatus.PENDING, DateTime.parse('2019-05-06'));

  final err500 = MyriadError(500, "Internal Server Error");

  final jsonCampaign = json.encode(campaign);
  final jsonResponse = json.encode(expectedResponse);

  group('Campaign.CreateCampaign', () {
    test('returns 500', () async* {
      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://abc.bogus.com/campaigns'));
        expect(req.headers['content-type'], 'application/json; charset=utf-8');
        expect(req.body, equals(jsonCampaign));
        return http.Response(
          json.encode(err500),
          500,
          headers: {'content-type': 'application/json; charset=utf-8'},
        );
      });
      
      final client = MyriadClient(
        ConnectionOptions("https://abc.bogus.com", appId:'appid',appSecret:'appkey'),
        httpClient: httpClient
      );
      
      try {
        var result = await client.campaigns.createCampaign(campaign);
        yield result;
      } on Response<MyriadError> catch (error) {
        expect(500, error.body.errorCode);
      } finally {
        httpClient.close();
      }
    });

    test('success', () async* {
      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://abc.bogus.com/campaigns'));
        expect(req.headers['content-type'], 'application/json; charset=utf-8');
        expect(req.body, equals(jsonCampaign));
        return http.Response(
          jsonResponse,
          200,
          headers: {'content-type': 'application/json; charset=utf-8'},
        );
      });

      final client = MyriadClient(
        ConnectionOptions("https://abc.bogus.com", appId:'appid',appSecret:'appkey'),
        httpClient: httpClient
      );
      
      final result = await client.campaigns.createCampaign(campaign);
      expect(json.encode(result.body), jsonResponse);

      httpClient.close();
    });

  });
}
