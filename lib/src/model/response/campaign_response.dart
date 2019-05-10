import 'package:json_annotation/json_annotation.dart';

import 'rule_response.dart';
import '../voucher_config.dart';
part 'campaign_response.g.dart';

enum CampaignStatus {
  PENDING, ACTIVE, INACTIVE, ARCHIVED
}

@JsonSerializable(includeIfNull: false)
class CampaignResponse {
  final String id;
  final DateTime updatedAt;
  final String name;
  final String type;
  final String description;
  final CampaignStatus status;
  final DateTime effective;
  final DateTime expiry;
  final Map<String, dynamic> metadata;

  CampaignResponse(this.id, this.name, this.type, this.effective, this.expiry, 
    Map<String, dynamic> metadata, this.status, this.updatedAt, [this.description])
    : this.metadata = metadata??<String,dynamic>{};

  factory CampaignResponse.fromJson(Map<String, dynamic> json) => _$CampaignResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CampaignResponseToJson(this);

}

@JsonSerializable(includeIfNull: false)
class VoucherCampaignResponse<T extends VoucherConfig> extends CampaignResponse {
  bool autoUpdate;

  @VoucherConfigConverter()
  T config;

  // redemption rules
  List<RuleResponse> rules;

  VoucherCampaignResponse(String id, String name, String type, DateTime effective, DateTime expiry, 
    this.autoUpdate, this.config, List<RuleResponse> rules, Map<String, dynamic> metadata, 
    CampaignStatus status, DateTime updatedAt, [String description]) 
    : this.rules = rules??<RuleResponse>[],
      super(id, name, type, effective, expiry, metadata, status, updatedAt);

  factory VoucherCampaignResponse.fromJson(Map<String, dynamic> json) => _$VoucherCampaignResponseFromJson<T>(json);
  Map<String, dynamic> toJson() => _$VoucherCampaignResponseToJson(this);
}

