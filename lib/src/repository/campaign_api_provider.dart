import 'package:dio/dio.dart';

import '../model/response/campaign_response.dart';
import '../model/campaign.dart';


class CampaignApiProvider {
  final Dio _dio;

  CampaignApiProvider(this._dio);

  Future<VoucherCampaignResponse> createCampaign(VoucherCampaign createCampaignRequest) async {
      try {
        Response response = await _dio.post<VoucherCampaignResponse>("/campaigns", data:createCampaignRequest.toJson());
        return VoucherCampaignResponse.fromJson(response.data);
      } catch(error, stacktrace) {
        print("Exception occured: $error stackTrace: $stacktrace");
        throw Exception("");
      }
  }

}