import 'package:test/test.dart';
import 'dart:convert';

import 'package:myriad_dart_sdk/src/model/discount.dart';

void main() {
  test('Discount json serialization', () {
    final discount1 = AmountDiscount(10);
    final jsonDiscount = _encode(discount1);
    final discount2 = AmountDiscount.fromJson(json.decode(jsonDiscount) as Map<String, dynamic>); 
    expect(discount1.amountOff, discount2.amountOff);
    expect(discount1.type, discount2.type);
    expect(_encode(discount2), equals(jsonDiscount));
  });
}

String _encode(Object object) =>
    const JsonEncoder.withIndent(' ').convert(object);