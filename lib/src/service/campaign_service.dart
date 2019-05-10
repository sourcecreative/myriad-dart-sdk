import 'package:rxdart/rxdart.dart';

import 'package:myriad_dart_sdk/src/repository/campaign_repository.dart';
import 'package:myriad_dart_sdk/src/model/campaign.dart';
import 'package:myriad_dart_sdk/src/model/response/campaign_response.dart';

class CampaignService {
  static const KEY = 'CampaignService';
  final CampaignRepository _repo;
  final BehaviorSubject<VoucherCampaignResponse> _subject = BehaviorSubject<VoucherCampaignResponse>();

  Observable<VoucherCampaignResponse> get anObservable => _subject.stream;

  CampaignService(this._repo);

  dispose() {
    _subject.close();
  }
  
  void createCampaign(VoucherCampaign voucherCampaign) async {
    VoucherCampaignResponse response = await _repo.createCampaign(voucherCampaign);
    _subject.sink.add(response);
  }

}