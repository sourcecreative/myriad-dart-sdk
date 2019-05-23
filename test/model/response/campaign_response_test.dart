import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'package:usage/uuid/uuid.dart';

import 'package:myriad_dart_sdk/myriad_sdk.dart';

void main() {
  
  test('CampaignResponse json serialization', () {
    final campaign1 = CampaignResponse('VoucherCampaign')
      ..id = 'uuid'
      ..name = '51 Sales'
      ..type = 'VOUCHER'
      ..effective = DateTime.parse('2019-05-01')
      ..expiry = DateTime.parse('2019-05-04')
      ..status = CampaignStatus.PENDING
      ..updatedAt = DateTime.parse('2019-04-28')
      ..metadata = {'locale':'en-GB'};
    final jsonCampaign = _encode(campaign1);
    final campaign2 = CampaignResponse.fromJson(json.decode(jsonCampaign) as Map<String, dynamic>); 
    expect(_encode(campaign2), equals(jsonCampaign));
  });

  test('VoucherCampaignResponse json serialization', () {
    final campaign1 = VoucherCampaignResponse()
      ..id = 'uuid'
      ..name = '51 Sales'
      ..type = 'VOUCHER'
      ..effective = DateTime.parse('2019-05-01')
      ..expiry = DateTime.parse('2019-05-04')
      ..autoUpdate = true
      ..config = CouponConfig(CodeConfig(length:10,charset:CodeConfig.ALPHABETIC), AmountDiscount(10))
      ..rules =  <RuleResponse>[RuleResponse('ruleid','order limit','order limit exceeds 30','order.amount>30')]
      ..status = CampaignStatus.PENDING
      ..updatedAt = DateTime.parse('2019-04-28')
      ..metadata = {'locale':'en-GB'};
    
    final jsonCampaign = _encode(campaign1);
    final campaign2 = VoucherCampaignResponse.fromJson(json.decode(jsonCampaign) as Map<String, dynamic>); 
    expect(_encode(campaign2), equals(jsonCampaign));
  });

  test('PaginatedCampaignsResponse', (){
    final campaign1 = CampaignResponse('VoucherCampaign')
      ..id=Uuid().generateV4()
      ..name='51 Sales'
      ..type='VOUCHER'
      ..effective=DateTime.parse('2019-05-01')
      ..expiry=DateTime.parse('2019-05-04')
      ..status=CampaignStatus.PENDING
      ..updatedAt=DateTime.parse('2019-04-28')
      ..metadata={'locale':'en-GB'};
    
    final campaign2 = CampaignResponse('VoucherCampaign')
      ..id=Uuid().generateV4()
      ..name='61 Sales'
      ..type='VOUCHER'
      ..effective=DateTime.parse('2019-06-01')
      ..expiry=DateTime.parse('2019-06-04')
      ..status=CampaignStatus.PENDING
      ..updatedAt=DateTime.parse('2019-05-28')
      ..metadata={'locale':'en-GB'};

    final resp = PaginatedCampaignResponse([campaign1, campaign2],100);
    final jsonResp = _encode(resp);
    final expected = PaginatedCampaignResponse.fromJson(json.decode(jsonResp) as Map<String,dynamic>);
    expect(_encode(expected),equals(jsonResp));
  });

}

String _encode(Object object) =>
    const JsonEncoder.withIndent(' ').convert(object);