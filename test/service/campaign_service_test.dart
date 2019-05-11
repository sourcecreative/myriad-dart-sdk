import 'package:myriad_dart_sdk/src/model/campaign.dart';
import 'package:myriad_dart_sdk/src/model/code_config.dart';
import 'package:myriad_dart_sdk/src/model/response/campaign_response.dart';
import 'package:myriad_dart_sdk/src/model/response/rule_response.dart';
import 'package:myriad_dart_sdk/src/model/voucher_config.dart';
import 'package:myriad_dart_sdk/src/module/campaign_module.dart';
import 'package:myriad_dart_sdk/src/myriad_client.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/src/observables/observable.dart';
import 'package:test/test.dart';
import 'dart:convert';

import 'package:myriad_dart_sdk/src/service/campaign_service.dart';

void main() {

  final campaign = VoucherCampaign('Gift Campaign', DateTime.parse('2019-05-06'), DateTime.parse('2019-07-08'),
    1000, GiftConfig(CodeConfig(length:10,charset:CodeConfig.ALPHABETIC), 'iPad'));
  
  final CampaignService campaignService = MockCampaignService();//CampaignModule(connection).campaigns;

  test('CampaignService.createCampaign', () {
    print(_encode(campaign));
    var observable = campaignService.createCampaign(campaign);
    observable.listen((data)=>print(_encode(data)));
  });

}

class MockCampaignService implements CampaignService {
  @override
  Observable<VoucherCampaignResponse<VoucherConfig>> createCampaign(VoucherCampaign<VoucherConfig> campaign) {
    var response = VoucherCampaignResponse('uuid', campaign.name, 'VOUCHER', campaign.effective, 
      campaign.expiry, campaign.autoUpdate, campaign.config, 
      <RuleResponse>[],//campaign.rules?.map((r)=>RuleResponse('uuid',r.name, r.description, r.condition)), 
      campaign.metadata, CampaignStatus.PENDING, DateTime.now());
    return Observable.just(response);
  }

}

String _encode(Object object) =>
    const JsonEncoder.withIndent(' ').convert(object);