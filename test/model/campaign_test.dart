import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

import 'package:myriad_dart_sdk/myriad_dart_sdk.dart';

void main() {
  test('CouponCampaign json serialization', () {
    final campaign1 = VoucherCampaign('Coupon Campaign', DateTime.parse('2019-05-06'), DateTime.parse('2019-07-08'),
      1000, CouponConfig(CodeConfig(length:10,charset:CodeConfig.ALPHABETIC), AmountDiscount(10)),
      rules:[Rule('order limit','order exceeds 30','order.amount > 30')],
      metadata:{'locale':'en-GB'});
    final jsonCampaign = _encode(campaign1);
    final campaign2 = VoucherCampaign.fromJson(json.decode(jsonCampaign) as Map<String, dynamic>); 
    expect(campaign1, campaign2);
    expect(_encode(campaign2), equals(jsonCampaign));
  });

  test('GiftCampaign json serialization', () {
    final campaign1 = VoucherCampaign('Gift Campaign', DateTime.parse('2019-05-06'), DateTime.parse('2019-07-08'),
      1000, GiftConfig(CodeConfig(length:10,charset:CodeConfig.ALPHABETIC), 'iPad'));
    final jsonCampaign = _encode(campaign1);
    final campaign2 = VoucherCampaign.fromJson(json.decode(jsonCampaign) as Map<String, dynamic>); 
    expect(campaign1, campaign2);
    expect(_encode(campaign2), equals(jsonCampaign));
  });
 
}

String _encode(Object object) =>
    const JsonEncoder.withIndent(' ').convert(object);