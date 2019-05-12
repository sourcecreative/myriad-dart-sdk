import 'package:myriad_dart_sdk/src/model/campaign.dart';
import 'package:myriad_dart_sdk/src/model/code_config.dart';
import 'package:myriad_dart_sdk/src/model/response/campaign_response.dart';
import 'package:myriad_dart_sdk/src/model/response/rule_response.dart';
import 'package:myriad_dart_sdk/src/model/voucher_config.dart';
import 'package:myriad_dart_sdk/src/myriad_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'dart:convert';

void main() {

  final campaign = VoucherCampaign('Gift Campaign', DateTime.parse('2019-05-06'), DateTime.parse('2019-07-08'),
    1000, GiftConfig(CodeConfig(length:10,charset:CodeConfig.ALPHABETIC), 'iPad'));

  final expectedResponse = VoucherCampaignResponse('uuid', campaign.name, 'VOUCHER', campaign.effective, 
    campaign.expiry, campaign.autoUpdate, campaign.config, 
    <RuleResponse>[],//campaign.rules?.map((r)=>RuleResponse('uuid',r.name, r.description, r.condition)), 
    campaign.metadata, CampaignStatus.PENDING, DateTime.parse('2019-05-06'));

  final jsonCampaign = json.encode(campaign);
  final jsonResponse = json.encode(expectedResponse);

  final client = MyriadClient(
    ConnectionOptions("https://abc.bogus.com", appId:'appid',appSecret:'appkey'),
    httpClient: MockClient((http.Request req) async {
      expect(req.url.toString(), equals('https://abc.bogus.com/campaigns'));
      expect(req.headers['content-type'], 'application/json; charset=utf-8');
      expect(req.body, equals(jsonCampaign));
      return http.Response(
        jsonResponse,
        200,
        headers: {'content-type': 'application/json; charset=utf-8'},
      );
    })
  );

  test('CampaignService.createCampaign success', () async {
    final result = await client.campaigns.createCampaign(campaign);
    expect(json.encode(result.body), jsonResponse);
  });

}
