import 'package:chopper/chopper.dart';
import 'package:myriad_dart_sdk/src/model/campaign.dart';
import 'package:myriad_dart_sdk/src/model/response/campaign_response.dart';
import 'package:myriad_dart_sdk/src/model/tier.dart';

part "promotion_service.chopper.dart";

@ChopperApi(baseUrl:"/promotions")
abstract class PromotionService extends ChopperService {
  static PromotionService newInstance([ChopperClient client]) => _$PromotionService(client);

  @Post()
  Future<Response<CampaignResponse>> create(@Body() PromotionCampaign promotion);

  @Post(path:"/{id}/tiers")
  Future<Response<CampaignResponse>> addTiers(@Path() String id, @Body() List<Tier> tiers);

  @Delete(path:"/{id}/tiers")
  Future<Response<CampaignResponse>> removeTiers(@Path() String id, @Body() List<Tier> tiers);

}