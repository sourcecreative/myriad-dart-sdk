import 'package:chopper/chopper.dart';
import 'package:myriad_dart_sdk/src/model/campaign.dart';
import 'package:myriad_dart_sdk/src/model/response/campaign_response.dart';
import 'package:myriad_dart_sdk/src/model/voucher_config.dart';

part "campaign_service.chopper.dart";

@ChopperApi(baseUrl:"/campaigns")
abstract class CampaignService extends ChopperService {
  static CampaignService newInstance([ChopperClient client]) => _$CampaignService(client);

  @Post()
  Future<Response<VoucherCampaignResponse>> create(@Body() VoucherCampaign<VoucherConfig> campaign);

  @Get(path:"/{id}")
  Future<Response<CampaignResponse>> findById(@Path() String id);

  @Get()
  Future<Response<PaginatedCampaignsResponse>> list({@Query() int page=1, @Query() int size=20});

  @Put(path:"/{id}")
  Future<Response<CampaignResponse>> update(@Path() String id, @Body() UpdateCampaign campaign);

  @Delete(path:"/{id}")
  Future<Response<void>> delete(@Path() String id);

}