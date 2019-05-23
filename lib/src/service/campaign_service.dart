import 'package:chopper/chopper.dart';

import 'package:myriad_dart_sdk/src/model/campaign.dart';
import 'package:myriad_dart_sdk/src/model/rule.dart';
import 'package:myriad_dart_sdk/src/model/tier.dart';
import 'package:myriad_dart_sdk/src/model/voucher.dart';
import 'package:myriad_dart_sdk/src/model/voucher_config.dart';

part "campaign_service.chopper.dart";

@ChopperApi(baseUrl:"/campaigns")
abstract class CampaignService extends ChopperService {
  static CampaignService newInstance([ChopperClient client]) => _$CampaignService(client);

  @Post()
  Future<Response<CampaignResponse>> create(@Body() Campaign campaign);

  @Get(path:"/{id}")
  Future<Response<CampaignResponse>> findById(@Path() String id);

  @Get()
  Future<Response<PaginatedCampaignResponse>> list({@QueryMap() Map<String,dynamic> filter = const <String,dynamic>{}, 
    @Query() int page=1, @Query() int size=20});

  @Put(path:"/{id}")
  Future<Response<CampaignResponse>> update(@Path() String id, @Body() UpdateCampaign campaign);

  @Delete(path:"/{id}")
  Future<Response<void>> delete(@Path() String id);

  @Post(path:"/{id}/vouchers/import")
  Future<Response<ImportVoucherResponse>> importVouchers(@Path() String id, @Body() List<Voucher<VoucherConfig>> voucher);

  /// Operations for Redemption Rules for Voucher Campaigns
  @Post(path:"/{id}/rules")
  Future<Response<RuleResponse>> addRule(@Path() String id, @Body() Rule rule);

  /// Update a given validation rule of a given Campaign
  /// @id the campaign identifier
  /// @ruleId identifier of the rule to be updated
  /// @rule rule data to be updated
  @Put(path:"/{id}/rules/{ruleId}")
  Future<Response<RuleResponse>> updateRule(@Path("id")String id, @Path("ruleId")String ruleId, @Body() Rule rule);

  @Delete(path:"/{id}/rules/{ruleId}")
  Future<Response<void>> removeRule(@Path("id") String id, @Path("ruleId") String ruleId);

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