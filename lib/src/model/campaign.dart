import 'package:json_annotation/json_annotation.dart';
import 'package:quiver/core.dart';
import 'package:quiver/collection.dart';

import 'voucher_config.dart';
import 'rule.dart';
import 'tier.dart';
import 'paginated_response.dart';

part 'campaign.g.dart';

enum CampaignType {
	VOUCHER, LOYALTY_PROGRAM, PROMOTION
}

enum CampaignStatus {
  PENDING, ACTIVE, INACTIVE, ARCHIVED
}

abstract class Campaign {
  String name;
  String description;
  String category;
  DateTime effective;
  DateTime expiry;
  CampaignType type;
  Map<String, dynamic> metadata;

  Campaign(this.type, this.name, this.effective, this.expiry, {this.description, this.category, Map<String, dynamic> metadata})
    : metadata = metadata ?? <String, dynamic>{};
}

@JsonSerializable(includeIfNull: false)
class VoucherCampaign<T extends VoucherConfig> extends Campaign {
  int totalSupply;
  bool autoUpdate;

  @VoucherConfigConverter()
  T config;

  VoucherCampaign(String name, DateTime effective, DateTime expiry, this.totalSupply, this.config, {
    this.autoUpdate: true, List<Rule> rules, String description, String category, Map<String, dynamic> metadata}) 
    : super(CampaignType.VOUCHER, name, effective,expiry,description:description,category:category,metadata:metadata);

  factory VoucherCampaign.fromJson(Map<String, dynamic> json) => _$VoucherCampaignFromJson<T>(json);
  Map<String, dynamic> toJson() => _$VoucherCampaignToJson(this);

  bool operator == (o) => o is VoucherCampaign && o.type == type && o.name == name
    && o.effective == effective && o.expiry == expiry
    && o.totalSupply == totalSupply && o.autoUpdate == autoUpdate && o.config == config
    && o.description == description && o.category == category && mapsEqual(o.metadata,metadata);

  int get hashCode => hashObjects([type,name,effective,expiry,totalSupply,autoUpdate,config,description,category,metadata]);

}

@JsonSerializable(includeIfNull: false)
class LoyaltyProgram extends VoucherCampaign<LoyaltyCardConfig> {

  LoyaltyProgram(String name, DateTime effective, DateTime expiry, int totalSupply, LoyaltyCardConfig config, {
    bool autoUpdate = true, String description, String category, Map<String, dynamic> metadata}) 
    : super(name, effective,expiry,totalSupply, config, autoUpdate:autoUpdate,
        description:description,category:category,metadata:metadata);

  factory LoyaltyProgram.fromJson(Map<String, dynamic> json) => _$LoyaltyProgramFromJson(json);
  Map<String, dynamic> toJson() => _$LoyaltyProgramToJson(this);

  bool operator == (o) => o is LoyaltyProgram && o.type == type && o.name == name
    && o.effective == effective && o.expiry == expiry 
    && o.totalSupply == totalSupply && o.autoUpdate == autoUpdate && o.config == config
    && o.description == description && o.category == category && mapsEqual(o.metadata,metadata);

  int get hashCode => hashObjects([type,name,effective,expiry,totalSupply,autoUpdate,
    config,description,category,metadata]);
}

@JsonSerializable(includeIfNull: false)
class PromotionCampaign extends Campaign {
  List<Tier> tiers;

  PromotionCampaign(String name, DateTime effective, DateTime expiry, this.tiers, {
    String description, String category, Map<String, dynamic> metadata
  }) : super(CampaignType.PROMOTION, name, effective, expiry,description:description,category:category,metadata:metadata);

  factory PromotionCampaign.fromJson(Map<String, dynamic> json) => _$PromotionCampaignFromJson(json);
  Map<String, dynamic> toJson() => _$PromotionCampaignToJson(this);

  bool operator == (o) => o is PromotionCampaign && o.type == type && o.name == name
    && o.effective == effective && o.expiry == expiry && listsEqual(o.tiers,tiers)
    && o.description == description && o.category == category && mapsEqual(o.metadata,metadata);

  int get hashCode => hashObjects([type,name,effective,expiry,tiers,description,category,metadata]);  
}

@JsonSerializable(includeIfNull: false)
class UpdateCampaign {
  String description;
  String category;
  DateTime effective;
  DateTime expiry;
  Map<String, dynamic> metadata;

  UpdateCampaign({this.description,this.category,this.effective,this.expiry,this.metadata});

  factory UpdateCampaign.fromJson(Map<String, dynamic> json) => _$UpdateCampaignFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateCampaignToJson(this);
}

/// Response
abstract class CampaignResponse {
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

  CampaignResponse();

}

@JsonSerializable(includeIfNull: false)
class VoucherCampaignResponse<T> extends CampaignResponse {
  bool autoUpdate;
  // voucher configuration
  @VoucherConfigConverter()
  T config;
  // redemption rules
  List<RuleResponse> rules;
  
  VoucherCampaignResponse();

  factory VoucherCampaignResponse.fromJson(Map<String, dynamic> json) => _$VoucherCampaignResponseFromJson<T>(json);
  Map<String, dynamic> toJson() => _$VoucherCampaignResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$VoucherCampaignResponseFromJson;
 
}

@JsonSerializable(includeIfNull: false)
class EarningRule {
  // name of the earning rule, e.g., Subscribe newsletter
  String name;
  // name of the event that triggers the rule, e.g., customer_subscribed
  String event;
  // validation rule to validate if condition is met to award points
  Rule rule;
  // earning points if rule is satisfied
  int points;

  EarningRule(this.name,this.event,this.points, [this.rule]);
  factory EarningRule.fromJson(Map<String, dynamic> json) => _$EarningRuleFromJson(json);
  Map<String, dynamic> toJson() => _$EarningRuleToJson(this);

}

@JsonSerializable(includeIfNull: false)
class RewardRule {
  String name;
  // required points for the reward
  int pointsRequired;
  // validation rule to limit reward usage
  Rule rule;
  // the campaign that this reward is applied to
  String campaignId;

  RewardRule(this.name,this.pointsRequired, this.rule, this.campaignId);
  factory RewardRule.fromJson(Map<String, dynamic> json) => _$RewardRuleFromJson(json);
  Map<String, dynamic> toJson() => _$RewardRuleToJson(this);

}

@JsonSerializable(includeIfNull: false)
class LoyaltyProgramResponse<T> extends VoucherCampaignResponse<LoyaltyCardConfig> {
  // earning rules for this program
  List<EarningRule> earningRules = <EarningRule>[];
  // reward rules for the program
  List<RewardRule> rewardRules = <RewardRule>[];
  
  LoyaltyProgramResponse();

  factory LoyaltyProgramResponse.fromJson(Map<String, dynamic> json) => _$LoyaltyProgramResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoyaltyProgramResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$LoyaltyProgramResponseFromJson;
 
}


@JsonSerializable(includeIfNull: false)
class PromotionCampaignResponse extends CampaignResponse {
  List<TierResponse> tiers;
  
  PromotionCampaignResponse();
  
  factory PromotionCampaignResponse.fromJson(Map<String, dynamic> json) => _$PromotionCampaignResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PromotionCampaignResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$PromotionCampaignResponseFromJson;
}

@JsonSerializable(includeIfNull: false)
class PaginatedCampaignResponse extends PaginatedResponse<VoucherCampaignResponse> {
  PaginatedCampaignResponse(List<VoucherCampaignResponse> entries, int total, { int page=1, int size=20}) 
    : super(entries, total, page:page, size:size);

 factory PaginatedCampaignResponse.fromJson(Map<String, dynamic> json) => _$PaginatedCampaignResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedCampaignResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$PaginatedCampaignResponseFromJson;
}

@JsonSerializable(includeIfNull: false)
class PaginatedPromotionResponse extends PaginatedResponse<PromotionCampaignResponse> {
  PaginatedPromotionResponse(List<PromotionCampaignResponse> entries, int total, { int page=1, int size=20}) 
    : super(entries, total, page:page, size:size);

 factory PaginatedPromotionResponse.fromJson(Map<String, dynamic> json) => _$PaginatedPromotionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedPromotionResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$PaginatedPromotionResponseFromJson;
}

@JsonSerializable(includeIfNull: false)
class PaginatedLoyaltyResponse extends PaginatedResponse<LoyaltyProgramResponse> {
  PaginatedLoyaltyResponse(List<LoyaltyProgramResponse> entries, int total, { int page=1, int size=20}) 
    : super(entries, total, page:page, size:size);

 factory PaginatedLoyaltyResponse.fromJson(Map<String, dynamic> json) => _$PaginatedLoyaltyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedLoyaltyResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$PaginatedLoyaltyResponseFromJson;
}

