import 'package:json_annotation/json_annotation.dart';
import 'package:quiver/core.dart';
import 'package:quiver/collection.dart';

import 'voucher_config.dart';
import 'rule.dart';
import 'tier.dart';

part 'campaign.g.dart';

enum CampaignType {
	VOUCHER, REFERRAL, PROMOTION
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

  List<Rule> rules;

  VoucherCampaign(String name, DateTime effective, DateTime expiry, this.totalSupply, this.config, {
    this.autoUpdate: true, List<Rule> rules, String description, String category, Map<String, dynamic> metadata}) 
    : rules = rules ?? <Rule>[],
      super(CampaignType.VOUCHER, name, effective,expiry,description:description,category:category,metadata:metadata);

  factory VoucherCampaign.fromJson(Map<String, dynamic> json) => _$VoucherCampaignFromJson<T>(json);
  Map<String, dynamic> toJson() => _$VoucherCampaignToJson(this);

  bool operator == (o) => o is VoucherCampaign && o.type == type && o.name == name
    && o.effective == effective && o.expiry == expiry
    && o.totalSupply == totalSupply && o.autoUpdate == autoUpdate && o.config == config
    && o.description == description && o.category == category && mapsEqual(o.metadata,metadata);

  int get hashCode => hashObjects([type,name,effective,expiry,totalSupply,autoUpdate,config,description,category,metadata]);

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

