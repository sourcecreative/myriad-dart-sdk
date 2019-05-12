import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

import 'package:myriad_dart_sdk/src/model/code_config.dart';

void main() {
  test('CodeConfig json serialization', () {
    final config1 = CodeConfig(length:10,charset:CodeConfig.ALPHABETIC);
    final jsonConfig = _encode(config1);
    print(jsonConfig);
    final config2 = CodeConfig.fromJson(json.decode(jsonConfig) as Map<String, dynamic>); 
    expect(config1.length, config2.length);
    expect(config1.charset, config2.charset);
    expect(_encode(config2), equals(jsonConfig));
  });
}

String _encode(Object object) =>
    const JsonEncoder.withIndent(' ').convert(object);