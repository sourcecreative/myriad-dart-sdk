import 'package:rxdart/rxdart.dart';

import 'campaign_api_provider.dart';
import '../model/campaign.dart';
import '../model/response/campaign_response.dart';

class CampaignRepository {
  CampaignApiProvider _provider;

  CampaignRepository(this._provider);

  Future<VoucherCampaignResponse> createCampaign(VoucherCampaign req) {
    return _provider.createCampaign(req);
  }
}