import 'package:chopper/chopper.dart';
import 'package:myriad_dart_sdk/src/model/campaign.dart';
import 'package:myriad_dart_sdk/src/model/tier.dart';

part "promotion_service.chopper.dart";

@ChopperApi(baseUrl:"/tiers")
abstract class TierService extends ChopperService {
  static TierService newInstance([ChopperClient client]) => _$TierService(client);

  @Post()
  Future<Response<TierResponse>> create(@Body() Tier tier);

  @Get(path:"/{id}")
  Future<Response<TierResponse>> findById(@Path() String id);

  @Put(path:"/{id}")
  Future<Response<TierResponse>> update(@Path() String id, @Body() Tier tier);

  @Delete(path:"/{id}")
  Future<Response<void>> delete(@Path() String id);

  @Get()
  Future<Response<PaginatedTierResponse>> list({@QueryMap() Map<String,dynamic> filter = const <String,dynamic>{}, 
    @Query() int page=1, @Query() int size=20});

}

@ChopperApi(baseUrl:"/promotions")
abstract class PromotionService extends ChopperService {
  static PromotionService newInstance([ChopperClient client]) => _$PromotionService(client);

  @Post()
  Future<Response<PromotionCampaignResponse>> create(@Body() PromotionCampaign campaign);

  @Get(path:"/{id}")
  Future<Response<PromotionCampaignResponse>> findById(@Path() String id);

  @Get()
  Future<Response<PaginatedPromotionResponse>> list({@QueryMap() Map<String,dynamic> filter = const <String,dynamic>{}, 
    @Query() int page=1, @Query() int size=20});

  @Put(path:"/{id}")
  Future<Response<PromotionCampaignResponse>> update(@Path() String id, @Body() UpdateCampaign campaign);

  @Delete(path:"/{id}")
  Future<Response<void>> delete(@Path() String id);

  /// Operations for Promotion Tiers for Promotion Campaigns
  /// Add promotion tiers to a campaign. The target campaign must be of PROMOTION type
  /// @id campaign identifier
  /// @tier a <code>Tier</code> object
  @Post(path:"/{id}/tiers")
  Future<Response<TierResponse>> addTier(@Path() String id, @Body() Tier tier);

  @Put(path:"/{id}/tiers/{tierId}")
  Future<Response<TierResponse>> updateTier(@Path("id") String id, @Path("tierId") String tierId, @Body() Tier tier);

  /// Remove a tier from a Promotion Campaign
  /// @id the promotion campaign identifier
  /// @tierId identifier of the tier to be removed
  @Delete(path:"/{id}/tiers/{tierId}")
  Future<Response<void>> removeTier(@Path("id") String id, @Path("tierId") String tierId);   

}