import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

import 'package:myriad_dart_sdk/myriad_dart_sdk.dart';

void main() {
  test('CodeConfig json serialization', () {
    final config1 = CodeConfig(length:10,charset:CodeConfig.ALPHABETIC);
    final jsonConfig = _encode(config1);
    final config2 = CodeConfig.fromJson(json.decode(jsonConfig) as Map<String, dynamic>); 
    expect(config1.length, config2.length);
    expect(config1.charset, config2.charset);
    expect(_encode(config2), equals(jsonConfig));
  });
  test('Discount json serialization', () {
    final discount1 = AmountDiscount(10);
    final jsonDiscount = _encode(discount1);
    final discount2 = AmountDiscount.fromJson(json.decode(jsonDiscount) as Map<String, dynamic>); 
    expect(discount1.amountOff, discount2.amountOff);
    expect(discount1.type, discount2.type);
    expect(_encode(discount2), equals(jsonDiscount));
  });

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