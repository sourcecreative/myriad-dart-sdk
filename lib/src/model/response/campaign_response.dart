import 'package:json_annotation/json_annotation.dart';
import 'package:myriad_dart_sdk/src/model/voucher_config.dart';

import 'response.dart';
import 'rule_response.dart';
import 'tier_response.dart';

part 'campaign_response.g.dart';

enum CampaignStatus {
  PENDING, ACTIVE, INACTIVE, ARCHIVED
}

@JsonSerializable(includeIfNull: false)
class CampaignResponse extends TypedResponse {
  String id;
  DateTime updatedAt;
  String name;
  String type;
  String description;
  String category;
  CampaignStatus status;
  DateTime effective;
  DateTime expiry;
  Map<String, dynamic> metadata;

  CampaignResponse(String objType) : super(objType);

  factory CampaignResponse.fromJson(Map<String, dynamic> json) => _$CampaignResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CampaignResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$CampaignResponseFromJson;

}

@JsonSerializable(includeIfNull: false)
class VoucherCampaignResponse<T> extends CampaignResponse {
  bool autoUpdate;

  @VoucherConfigConverter()
  T config;

  List<RuleResponse> rules;
  
  VoucherCampaignResponse() : super('VoucherCampaignResponse');

  factory VoucherCampaignResponse.fromJson(Map<String, dynamic> json) => _$VoucherCampaignResponseFromJson<T>(json);
  Map<String, dynamic> toJson() => _$VoucherCampaignResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$VoucherCampaignResponseFromJson;
 
}

@JsonSerializable(includeIfNull: false)
class PromotionCampaignResponse extends CampaignResponse {
  List<TierResponse> tiers;
  
  PromotionCampaignResponse() : super('PromotionCampaignResponse');
  
  factory PromotionCampaignResponse.fromJson(Map<String, dynamic> json) => _$PromotionCampaignResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PromotionCampaignResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$PromotionCampaignResponseFromJson;
}

@JsonSerializable(includeIfNull: false)
class PaginatedCampaignResponse extends PaginatedResponse<CampaignResponse> {
  PaginatedCampaignResponse(List<CampaignResponse> entries, int total, { int page=1, int size=20}) 
    : super("PaginatedCampaignResponse",entries, total, page:page, size:size);

 factory PaginatedCampaignResponse.fromJson(Map<String, dynamic> json) => _$PaginatedCampaignResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedCampaignResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$PaginatedCampaignResponseFromJson;
}

