import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:myriad_dart_sdk/src/model/customer.dart';
import 'package:usage/uuid/uuid.dart';
import 'dart:convert';

import 'package:myriad_dart_sdk/myriad_dart_sdk.dart';

void main() async {
  group('ValidationService.validate', () {
    test('create a validation rule', () async {
      // request object
      var validation = VoucherValidation(Uuid().generateV4(),
        Customer(Uuid().generateV4(),sourceId:Uuid().generateV4(),name:'test'),
        Order(Currency.RMB,<OrderItem>[
          OrderItem('iPhoneX', 1, 800000),
          OrderItem('iPad', 1, 400000)
        ])
      );
      var jsonReq = json.encode(validation);
      var custResp = CustomerResponse(Uuid().generateV4())
        ..sourceId = validation.customer.sourceId
        ..name = validation.customer.name;
      var orderResp = OrderResponse(Uuid().generateV4())
        ..currency = validation.order.currency
        ..items = validation.order.items;
      var expectedResp = VoucherValidationResponse()
        ..customer = custResp
        ..order = orderResp;
      var jsonResp = json.encode(expectedResp);
      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/validations/'));
        expect(req.headers['content-type'], 'application/json; charset=utf-8');
        expect(req.body, equals(jsonReq));
        return http.Response(
          jsonResp,
          200,
          headers: {'content-type': 'application/json; charset=utf-8'},
        );
      });
      
      var client = MyriadClient.build(
        ConnectionOptions("https://api.sourcecreative.io", appId:'appid',appSecret:'appkey'),
        httpClient: httpClient
      );

      var resp = await client.validations.validate(validation);
      expect(json.encode(resp.body), equals(jsonResp));
      httpClient.close();
    });
  });
}