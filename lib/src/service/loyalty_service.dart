import 'package:chopper/chopper.dart';

import 'package:myriad_dart_sdk/src/model/campaign.dart';
import 'package:myriad_dart_sdk/src/model/voucher.dart';

part "loyalty_service.chopper.dart";

@ChopperApi(baseUrl:"/campaigns")
abstract class LoyaltyService extends ChopperService {
  static LoyaltyService newInstance([ChopperClient client]) => _$LoyaltyService(client);

  @Post()
  Future<Response<LoyaltyProgramResponse>> create(@Body() LoyaltyProgram campaign);

  @Get(path:"/{id}")
  Future<Response<LoyaltyProgramResponse>> findById(@Path() String id);

  @Get()
  Future<Response<PaginatedLoyaltyResponse>> list({@QueryMap() Map<String,dynamic> filter = const <String,dynamic>{}, 
    @Query() int page=1, @Query() int size=20});

  @Put(path:"/{id}")
  Future<Response<LoyaltyProgramResponse>> update(@Path() String id, @Body() UpdateCampaign campaign);

  @Delete(path:"/{id}")
  Future<Response<void>> delete(@Path() String id);

  /// APIs for Earning rules
  
  /// Add an earning rule to the loyalty program
  @Post(path:"/{id}/earning-rules")
  Future<Response<EarningRuleResponse>> addEarningRule(@Path() String id, @Body() EarningRule rule);

  /// update an earning rule of the loyalty program
  @Put(path:"/{id}/earning-rules/{ruleId}")
  Future<Response<EarningRuleResponse>> updateEarningRule(@Path("id")String id, 
    @Path("ruleId")String ruleId, @Body()EarningRule rule);

  /// delete an earning rule of the loyalty program
  @Delete(path:"/{id}/earning-rules/{ruleId}")
  Future<Response<void>> removeEarningRule(@Path("id")String id, @Path("ruleId")String ruleId);

  /// list earning rules of the loyalty program page by page
  @Get(path:"/{id}/earning-rules")
  Future<Response<PaginatedEarningRuleResponse>> listEarningRules(@Path("id")String id,
    {@Query() int page=1, @Query() int size=20});

  /// APIs for Reward rules
  
  /// Add a reward rule to a loyalty program
  /// @id id of a LoyaltyProgram
  /// @rule a <code>RewardRule</code>
  @Post(path:"/{id}/reward-rules")
  Future<Response<RewardRuleResponse>> addRewardRule(@Path() String id, @Body() RewardRule rule);

  @Put(path:"/{id}/reward-rules/{ruleId}")
  Future<Response<RewardRuleResponse>> updateRewardRule(@Path("id")String id, 
    @Path("ruleId")String ruleId, @Body()EarningRule rule);

  @Delete(path:"/{id}/reward-rules/{ruleId}")
  Future<Response<void>> removeRewardRule(@Path("id")String id, @Path("ruleId")String ruleId);

  @Get(path:"/{id}/reward-rules")
  Future<Response<PaginatedRewardRuleResponse>> listRewardRules(@Path("id")String id,
    {@Query() int page=1, @Query() int size=20});

  /// APIs for Membership Cards
  
  @Post(path:"/{id}/memberships")
  Future<Response<MembershipResponse>> createMembership(@Path() String id, @Body() Membership membership);

  @Get(path:"/{id}/memberships/{membershipId}")
  Future<Response<MembershipResponse>> findMemberById(@Path("id")String id, @Path("membershipId")String membershipId);

  @Get(path:"/{id}/memberships")
  Future<Response<PaginatedMembershipResponse>> listMemberships(@Path("id")String id, 
    {@Query() int page = 1, @Query() int size = 20});

  @Put(path:"/{id}/memberships/{membershipId}/balance")
  Future<Response<MembershipResponse>> addBalance(@Path("id") String id, 
    @Path("membershipId")String membershipId, @Body() int points);

}