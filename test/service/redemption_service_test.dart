import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:myriad_dart_sdk/src/model/customer.dart';
import 'package:usage/uuid/uuid.dart';
import 'dart:convert';

import 'package:myriad_dart_sdk/myriad_sdk.dart';

void main() async {
  group('RedemptionService.validate', () {
    test('validate a voucher', () async {
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
      var voucherResp = VoucherResponse<CouponConfig>()
        ..id = validation.voucherId
        ..campaignId = Uuid().generateV4()
        ..code = Uuid().generateV4()
        ..config = CouponConfig(CodeConfig(), AmountDiscount(10))
        ..status = VoucherStatus.ISSUED;
      var orderResp = OrderResponse(Uuid().generateV4())
        ..currency = validation.order.currency
        ..customer = custResp
        ..items = validation.order.items;
      var expectedResp = VoucherValidationResponse(voucherResp,orderResp);
      var jsonResp = json.encode(expectedResp);
      
      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/redemptions/'));
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

      var resp = await client.redemptions.validateVoucher(validation);
      expect(json.encode(resp.body), equals(jsonResp));
      httpClient.close();
    });

    test('validate promotions', () async {
      // request object
      var validation = Validation(
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
        ..customer = custResp
        ..items = validation.order.items;
      var promotionTiers = <TierResponse>[
        TierResponse(Uuid().generateV4(),'tier1',
          <RuleResponse>[
            RuleResponse(Uuid().generateV4(), 'order amount limit', 
              'order amount must be greater than 100', 'order.amount > 10000')
          ]
        )
          ..campaignId = Uuid().generateV4(),
        TierResponse(Uuid().generateV4(),'tier2',
          <RuleResponse>[
            RuleResponse(Uuid().generateV4(), 'order product restriction', 
              'order must include iPhoneX', 'order.items["iPhoneX"] != null')
          ]
        )..campaignId = Uuid().generateV4()
      ];
      var expectedResp = PromotionValidationResponse(promotionTiers,orderResp);
      var jsonResp = json.encode(expectedResp);
      
      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/redemptions/'));
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

      var resp = await client.redemptions.validatePromotion(validation);
      expect(json.encode(resp.body), equals(jsonResp));
      httpClient.close();
    });

  });

  group('RedemptionService.redeem', () {
    test('redeem a voucher', () async {
      // request object
      var redemption = VoucherRedemption(Uuid().generateV4(),
        Customer(Uuid().generateV4(),sourceId:Uuid().generateV4(),name:'test'),
        Order(Currency.RMB,<OrderItem>[
          OrderItem('iPhoneX', 1, 800000),
          OrderItem('iPad', 1, 400000)
        ])
      );
      var jsonReq = json.encode(redemption);
      var custResp = CustomerResponse(Uuid().generateV4())
        ..sourceId = redemption.customer.sourceId
        ..name = redemption.customer.name;
      var voucherResp = VoucherResponse<CouponConfig>()
        ..id = redemption.voucherId
        ..campaignId = Uuid().generateV4()
        ..code = Uuid().generateV4()
        ..config = CouponConfig(CodeConfig(), AmountDiscount(80000))
        ..status = VoucherStatus.ISSUED;
      var orderResp = OrderResponse(Uuid().generateV4())
        ..currency = redemption.order.currency
        ..amount = redemption.order.amount
        ..discount = (voucherResp.config.discount as AmountDiscount).amountOff
        ..customer = custResp
        ..items = redemption.order.items;
      var expectedResp = VoucherRedemptionResponse(orderResp,voucherResp)
        ..status = RedemptionStatus.SUCCESS;
      var jsonResp = json.encode(expectedResp);
      //print(jsonResp);
      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/redemptions/'));
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

      var resp = await client.redemptions.redeemVoucher(redemption);
      expect(json.encode(resp.body), equals(jsonResp));
      httpClient.close();
    });

    test('redeem via a promotion tier', () async {
      // request object
      var redemption = PromotionRedemption(Uuid().generateV4(),
        Customer(Uuid().generateV4(),sourceId:Uuid().generateV4(),name:'test'),
        Order(Currency.RMB,<OrderItem>[
          OrderItem('iPhoneX', 1, 800000),
          OrderItem('iPad', 1, 400000)
        ])
      );
      var jsonReq = json.encode(redemption);
      var custResp = CustomerResponse(Uuid().generateV4())
        ..sourceId = redemption.customer.sourceId
        ..name = redemption.customer.name;
      var tierResp = TierResponse(redemption.promotionTierId, 'tier1',
        <RuleResponse>[
          RuleResponse(Uuid().generateV4(),'rule1','order amount > 100000',
            'order.amount > 100000',
            'order.discount = order.amount * 0.1')
        ]
      );
      var orderResp = OrderResponse(Uuid().generateV4())
        ..currency = redemption.order.currency
        ..amount = redemption.order.amount
        ..discount = 120000
        ..customer = custResp
        ..items = redemption.order.items;
      var expectedResp = PromotionRedemptionResponse(orderResp,tierResp)
        ..status = RedemptionStatus.SUCCESS;
      var jsonResp = json.encode(expectedResp);
      //print(jsonResp);
      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/redemptions/'));
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

      var resp = await client.redemptions.redeemPromotion(redemption);
      expect(json.encode(resp.body), equals(jsonResp));
      httpClient.close();
    });

  });
}