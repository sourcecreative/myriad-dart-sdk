import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

import 'package:myriad_dart_sdk/src/model/response/campaign_response.dart';
import 'package:myriad_dart_sdk/src/model/response/rule_response.dart';
import 'package:myriad_dart_sdk/src/model/voucher_config.dart';

void main() {
  test('CampaignResponse json serialization', () {
    final campaign1 = CampaignResponse('uuid','51 Sales','VOUCHER',
      DateTime.parse('2019-05-01'),DateTime.parse('2019-05-04'),
      {'locale':'en-GB'}, CampaignStatus.PENDING,
      DateTime.parse('2019-04-28')
    );
    final jsonCampaign = _encode(campaign1);
    final campaign2 = CampaignResponse.fromJson(json.decode(jsonCampaign) as Map<String, dynamic>); 
    expect(_encode(campaign2), equals(jsonCampaign));
  });

  test('VoucherCampaignResponse json serialization', () {
    final campaign1 = VoucherCampaignResponse('uuid','51 Sales','VOUCHER',
      DateTime.parse('2019-05-01'),DateTime.parse('2019-05-04'), true,
      CouponConfig(CodeConfig(length:10,charset:CodeConfig.ALPHABETIC), AmountDiscount(10)), 
      <RuleResponse>[RuleResponse('ruleid','order limit','order limit exceeds 30','order.amount>30')],
      {'locale':'en-GB'}, CampaignStatus.PENDING,
      DateTime.parse('2019-04-28')
    );
    final jsonCampaign = _encode(campaign1);
    final campaign2 = VoucherCampaignResponse.fromJson(json.decode(jsonCampaign) as Map<String, dynamic>); 
    expect(_encode(campaign2), equals(jsonCampaign));
  });

}

String _encode(Object object) =>
    const JsonEncoder.withIndent(' ').convert(object);