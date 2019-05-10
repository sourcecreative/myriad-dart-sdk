import 'package:test/test.dart';
import 'dart:convert';

import 'package:myriad_dart_sdk/src/model/voucher_config.dart';
import 'package:myriad_dart_sdk/src/model/code_config.dart';
import 'package:myriad_dart_sdk/src/model/discount.dart';

void main() {
  test('CouponConfig json serialization', () {
    final config1 = CouponConfig(
      CodeConfig(length:10,charset:CodeConfig.ALPHABETIC), 
      AmountDiscount(10)
    );
    final jsonConfig = _encode(config1);
    final config2 = CouponConfig.fromJson(json.decode(jsonConfig) as Map<String, dynamic>); 
    expect(config1.codeConfig, config2.codeConfig);
    expect(config1.discount, config2.discount);
    expect(config1.redemption, config2.redemption);
    expect(config1.type, config2.type);
    expect(_encode(config2), equals(jsonConfig));
  });

  test('PrepaidCardConfig json serialization', (){
    final config1 = PrepaidCardConfig(
      CodeConfig(length:10,charset:CodeConfig.ALPHABETIC),100.20, 10);
    final jsonConfig = _encode(config1);
    final config2 = PrepaidCardConfig.fromJson(json.decode(jsonConfig) as Map<String, dynamic>); 
    expect(config1.codeConfig, config2.codeConfig);
    expect(config1.amount, config2.amount);
    expect(config1.redemption, config2.redemption);
    expect(config1.type, config2.type);
    expect(_encode(config2), equals(jsonConfig));
  });

  test('GiftConfig json serialization', (){
    final config1 = GiftConfig(
      CodeConfig(length:10,charset:CodeConfig.ALPHABETIC),'iPad');
    final jsonConfig = _encode(config1);
    final config2 = GiftConfig.fromJson(json.decode(jsonConfig) as Map<String, dynamic>); 
    expect(config1.codeConfig, config2.codeConfig);
    expect(config1.product, config2.product);
    expect(config1.redemption, config2.redemption);
    expect(config1.type, config2.type);
    expect(_encode(config2), equals(jsonConfig));
  });
}

String _encode(Object object) =>
    const JsonEncoder.withIndent(' ').convert(object);