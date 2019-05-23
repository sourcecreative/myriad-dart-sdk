import 'package:chopper/chopper.dart';
import 'package:myriad_dart_sdk/src/model/validation.dart';

part "redemption_service.chopper.dart";

@ChopperApi(baseUrl:"/redemptions")
abstract class RedemptionService extends ChopperService {
  static RedemptionService newInstance([ChopperClient client]) => _$RedemptionService(client);

  @Post()
  Future<Response<ValidationResponse>> validate(@Body() Validation validation);

  @Post()
  Future<Response<RedemptionResponse>> redeem(@Body() Redemption redemption);
}