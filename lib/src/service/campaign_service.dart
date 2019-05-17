import 'package:chopper/chopper.dart';

import 'package:myriad_dart_sdk/src/model/campaign.dart';
import 'package:myriad_dart_sdk/src/model/response/campaign_response.dart';
import 'package:myriad_dart_sdk/src/model/rule.dart';

part "campaign_service.chopper.dart";

@ChopperApi(baseUrl:"/campaigns")
abstract class CampaignService extends ChopperService {
  static CampaignService newInstance([ChopperClient client]) => _$CampaignService(client);

  @Post()
  Future<Response<CampaignResponse>> create(@Body() Campaign campaign);

  @Get(path:"/{id}")
  Future<Response<CampaignResponse>> findById(@Path() String id);

  @Get()
  Future<Response<PaginatedCampaignResponse>> list({@Query() int page=1, @Query() int size=20});

  @Put(path:"/{id}")
  Future<Response<CampaignResponse>> update(@Path() String id, @Body() UpdateCampaign campaign);

  @Delete(path:"/{id}")
  Future<Response<void>> delete(@Path() String id);

  @Post(path:"/{id}/rules")
  Future<Response<CampaignResponse>> attachRules(@Path() String id, @Body() Set<Rule> rules);

  @Delete(path:"/{id}/rules")
  Future<Response<CampaignResponse>> detachRules(@Path() String id);

  @Delete(path:"/{id}/rules/{ruleId}")
  Future<Response<CampaignResponse>> detachRule(@Path("id") String id, @Path("ruleId") String ruleId);

}