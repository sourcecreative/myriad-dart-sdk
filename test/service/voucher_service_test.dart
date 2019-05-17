import 'package:chopper/chopper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:usage/uuid/uuid.dart';
import 'dart:convert';

import 'package:myriad_dart_sdk/myriad_dart_sdk.dart';

void main() async {
  group('VoucherService.create', () {
    test('create a coupon', () async {
      // request object
      var coupon = Voucher<CouponConfig>(
        CouponConfig(CodeConfig(), AmountDiscount(10))
      );
      var jsonReq = json.encode(coupon);
      var expectedResp = VoucherResponse()
        ..id=Uuid().generateV4()
        ..redeemedQuantity=0
        ..status=VoucherStatus.ISSUED
        ..updatedAt=DateTime.now()
        ..code=Uuid().generateV4()
        ..config=coupon.config;
      var jsonResp = json.encode(expectedResp);

      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/vouchers/'));
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

      var resp = await client.vouchers.create(coupon);
      expect(json.encode(resp.body), equals(jsonResp));
      httpClient.close();
    });

    test('create a gift voucher', () async {
      // request object
      var voucher = Voucher<GiftConfig>(
        GiftConfig(CodeConfig(), "iPhone X")
      );
      var jsonReq = json.encode(voucher);
      var expectedResp = VoucherResponse()
        ..id=Uuid().generateV4()
        ..redeemedQuantity=0
        ..status=VoucherStatus.ISSUED
        ..updatedAt=DateTime.now()
        ..code=Uuid().generateV4()
        ..config=voucher.config;
      var jsonResp = json.encode(expectedResp);
      
      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/vouchers/'));
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

      var resp = await client.vouchers.create(voucher);
      expect(json.encode(resp.body), equals(jsonResp));
      httpClient.close();
    });

    test('create a prepaid card', () async {
      // request object
      var prepaidcard = Voucher<PrepaidCardConfig>(
        PrepaidCardConfig(CodeConfig(), 20)
      );
      var jsonReq = json.encode(prepaidcard);
      var expectedResp = VoucherResponse()
        ..id=Uuid().generateV4()
        ..redeemedQuantity=0
        ..status=VoucherStatus.ISSUED
        ..updatedAt=DateTime.now()
        ..code=Uuid().generateV4()
        ..config=prepaidcard.config;
      var jsonResp = json.encode(expectedResp);
      
      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/vouchers/'));
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

      var resp = await client.vouchers.create(prepaidcard);
      expect(json.encode(resp.body), equals(jsonResp));
      httpClient.close();
    });
  });

  group("VoucherService.findById",() {
    test("success", () async {
      var resp = VoucherResponse()
        ..id="dcf9c4d9-1d99-42d0-b4f2-5b631fe54ea2"
        ..status=VoucherStatus.ISSUED
        ..updatedAt=DateTime.now()
        ..metadata=<String,dynamic>{}
        ..code=Uuid().generateV4();
      var jsonResp = json.encode(resp);
      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/vouchers/dcf9c4d9-1d99-42d0-b4f2-5b631fe54ea2'));
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

      var r = await client.vouchers.findById("dcf9c4d9-1d99-42d0-b4f2-5b631fe54ea2");
      expect(json.encode(r.body), equals(jsonResp));
      httpClient.close();
    });

    test("voucher not found (404)", () async {
      var errorResp = MyriadError(404, "Voucher Not Found");
      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/vouchers/dcf9c4d9-1d99-42d0-b4f2-5b631fe54ea2'));
        return http.Response(
          json.encode(errorResp),
          404,
          headers: {'content-type': 'application/json; charset=utf-8'},
        );
      });

      var client = MyriadClient.build(
        ConnectionOptions("https://api.sourcecreative.io", appId:'appid',appSecret:'appkey'),
        httpClient: httpClient
      );

      var r = client.vouchers.findById("dcf9c4d9-1d99-42d0-b4f2-5b631fe54ea2");
      expect(r, throwsA(predicate((e) => e is Response<MyriadError> && e.body.errorCode == 404)));
      httpClient.close();
    });

  });

  group("VoucherService.update", (){
    test("success", () async {
      var updateReq = UpdateVoucher(category: "test", 
        metadata: <String,dynamic>{"locale":"en_GB"});
      var jsonReq = json.encode(updateReq);
      var updateResp = VoucherResponse()
        ..id="dcf9c4d9-1d99-42d0-b4f2-5b631fe54ea2"
        ..status=VoucherStatus.ISSUED
        ..updatedAt=DateTime.now()
        ..metadata=<String,dynamic>{}
        ..config=GiftConfig(CodeConfig(), "iPhone X")
        ..code=Uuid().generateV4();
      var jsonResp = json.encode(updateResp);

      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/vouchers/dcf9c4d9-1d99-42d0-b4f2-5b631fe54ea2'));
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

      var r = await client.vouchers.update("dcf9c4d9-1d99-42d0-b4f2-5b631fe54ea2",updateReq);
      expect(json.encode(r.body), equals(jsonResp));
      httpClient.close();
    });

  });

  group("VoucherService.delete", (){
    test("success", () async {
      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/vouchers/dcf9c4d9-1d99-42d0-b4f2-5b631fe54ea2'));
        return http.Response(
          "",
          200,
          headers: {'content-type': 'application/json; charset=utf-8'},
        );
      });

      var client = MyriadClient.build(
        ConnectionOptions("https://api.sourcecreative.io", appId:'appid',appSecret:'appkey'),
        httpClient: httpClient
      );

      Response<void> r = await client.vouchers.delete("dcf9c4d9-1d99-42d0-b4f2-5b631fe54ea2");
      expect(r.isSuccessful, isTrue);
      httpClient.close();
    });

  });

  group("VoucherService.list",() {
    test("success", () async {
      var voucher1 = VoucherResponse()
        ..id="dcf9c4d9-1d99-42d0-b4f2-5b631fe54ea1"
        ..config=GiftConfig(CodeConfig(),"iPhone X")
        ..status=VoucherStatus.ISSUED
        ..updatedAt=DateTime.parse("2019-06-01")
        ..metadata=<String,dynamic>{}
        ..code="test1";
      var voucher2 = VoucherResponse()
        ..id="abf9c4d9-1d99-42d0-b4f2-5b631fe54ea1"
        ..config=CouponConfig(CodeConfig(),AmountDiscount(10))
        ..status=VoucherStatus.ISSUED
        ..updatedAt=DateTime.parse("2019-06-01")
        ..metadata=<String,dynamic>{}
        ..code="test2";
      var vouchers = PaginatedVoucherResponse([voucher1,voucher2],2);
      var jsonResp = json.encode(vouchers);
      
      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/vouchers/?page=1&size=20'));
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

      var r = await client.vouchers.list();
      expect(json.encode(r.body), equals(jsonResp));
      httpClient.close();
    });
  });

  group("VoucherService.import",() {
    test("success", () async {
      var voucher1 = Voucher(GiftConfig(CodeConfig(),"iPhone X"))
        ..metadata=<String,dynamic>{}
        ..category="test"
        ..code="test1";
      var voucher2 = Voucher(CouponConfig(CodeConfig(),AmountDiscount(10)))
        ..metadata=<String,dynamic>{}
        ..category="test"
        ..code="test2";
      var vouchers = [voucher1,voucher2];
      var jsonResp = json.encode(ImportVoucherResponse()
        ..count = 2
        ..imported = 2);
      
      var httpClient = MockClient((http.Request req) async {
        expect(req.url.toString(), equals('https://api.sourcecreative.io/vouchers/import'));
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

      var r = await client.vouchers.import(vouchers);
      expect(json.encode(r.body), equals(jsonResp));
      httpClient.close();
    });
  });

}