import 'package:rxdart/rxdart.dart';

import 'package:myriad_dart_sdk/src/repository/campaign_repository.dart';
import 'package:myriad_dart_sdk/src/model/campaign.dart';
import 'package:myriad_dart_sdk/src/model/response/campaign_response.dart';

class CampaignService {
  final CampaignRepository _campaignRepo;

  CampaignService(this._campaignRepo);

  Observable<VoucherCampaignResponse> createCampaign(VoucherCampaign voucherCampaign) {
    return Observable.fromFuture(_campaignRepo.createCampaign(voucherCampaign));
  }

}