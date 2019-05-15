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

  static const dynamic Function(Map<String, dynamic>) deserialize = _$CampaignResponseFromJson;

}

@JsonSerializable(includeIfNull: false)
class VoucherCampaignResponse<T> extends CampaignResponse {
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

  static const dynamic Function(Map<String, dynamic>) deserialize = _$VoucherCampaignResponseFromJson;
}

@JsonSerializable(includeIfNull: false)
class PaginatedCampaignsResponse {
  final int total;
  final int page;
  final int size;
  final List<CampaignResponse> campaigns;

  PaginatedCampaignsResponse(this.campaigns, {this.total, this.page=1, this.size=20});

  factory PaginatedCampaignsResponse.fromJson(Map<String, dynamic> json) => _$PaginatedCampaignsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedCampaignsResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$PaginatedCampaignsResponseFromJson;
}

