// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$CampaignService extends CampaignService {
  _$CampaignService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = CampaignService;

  Future<Response<VoucherCampaignResponse>> createCampaign(
      VoucherCampaign<VoucherConfig> campaign) {
    final $url = '/campaigns';
    final $body = campaign;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client
        .send<VoucherCampaignResponse, VoucherCampaignResponse>($request);
  }
}
