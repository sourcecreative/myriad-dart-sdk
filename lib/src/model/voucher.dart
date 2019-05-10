import 'voucher_config.dart';

class CreateVoucherRequest {
  String campaignId;
  String code;
  VoucherConfig config;
  Map<String, dynamic> metadata = {};

  CreateVoucherRequest(this.config,{this.campaignId, this.code, this.metadata});
}