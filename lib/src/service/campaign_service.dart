import 'package:chopper/chopper.dart';
import 'package:myriad_dart_sdk/src/model/campaign.dart';
import 'package:myriad_dart_sdk/src/model/response/campaign_response.dart';
import 'package:myriad_dart_sdk/src/model/voucher_config.dart';

part "campaign_service.chopper.dart";

@ChopperApi()
abstract class CampaignService extends ChopperService {
  static CampaignService create([ChopperClient client]) => _$CampaignService(client);

  @Post(path:"campaigns")
  Future<Response<VoucherCampaignResponse>> createCampaign(@Body() VoucherCampaign<VoucherConfig> campaign);
}