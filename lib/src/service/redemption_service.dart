import 'package:chopper/chopper.dart';
import 'package:myriad_dart_sdk/src/model/validation.dart';

part "redemption_service.chopper.dart";

@ChopperApi(baseUrl:"/redemptions")
abstract class RedemptionService extends ChopperService {
  static RedemptionService newInstance([ChopperClient client]) => _$RedemptionService(client);

  @Post()
  Future<Response<VoucherValidationResponse>> validateVoucher(@Body() VoucherValidation validation);

  @Post()
  Future<Response<PromotionValidationResponse>> validatePromotion(@Body() Validation validation);

  @Post()
  Future<Response<VoucherRedemptionResponse>> redeemCoupon(@Body() CouponRedemption redemption);

  @Post()
  Future<Response<PromotionRedemptionResponse>> redeemPromotion(@Body() PromotionRedemption redemption);

}