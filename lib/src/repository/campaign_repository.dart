import 'package:dio/dio.dart';

import '../../myriad_dart_sdk.dart';
import '../model/campaign.dart';
import '../model/response/campaign_response.dart';

class CampaignApiProvider {
  final MyriadConnection _connection;

  CampaignApiProvider(this._connection);

  Future<VoucherCampaignResponse> createCampaign(VoucherCampaign createCampaignRequest) async {
    try {
      Response response = await _connection.post<VoucherCampaignResponse>("/campaigns", data:createCampaignRequest);
      return VoucherCampaignResponse.fromJson(response.data);
    } catch(error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      throw Exception("");
    }
  }
}

class CampaignRepository {
  final CampaignApiProvider _provider;

  CampaignRepository(this._provider);

  Future<VoucherCampaignResponse> createCampaign(VoucherCampaign req) async {
    return await _provider.createCampaign(req);
  }
}