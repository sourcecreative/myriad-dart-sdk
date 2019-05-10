import 'package:json_annotation/json_annotation.dart';
import 'package:quiver/core.dart';
import 'package:quiver/collection.dart';

import 'voucher_config.dart';
import 'rule.dart';

part 'campaign.g.dart';

enum CampaignType {
	VOUCHER, REFERRAL, PROMOTION
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

  @_VoucherConfigConverter()
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

class _VoucherConfigConverter<T> implements JsonConverter<T, Object> {
  const _VoucherConfigConverter();
  @override
  T fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      var voucherType = json['type'];
      if (voucherType == _getSimpleName(VoucherType.COUPON)) 
        return CouponConfig.fromJson(json) as T;
      else if (voucherType == _getSimpleName(VoucherType.GIFT))
        return GiftConfig.fromJson(json) as T;
      else if (voucherType == _getSimpleName(VoucherType.PREPAID_CARD))
        return PrepaidCardConfig.fromJson(json) as T;
      else
        throw Exception("Unknown Voucher Type");  
    }
    // This will only work if `json` is a native JSON type:
    //   num, String, bool, null, etc
    // *and* is assignable to `T`.
    return json as T;
  }

  String _getSimpleName(dynamic enumValue) {
    return enumValue.toString().split('.').last;
  }

  @override
  Object toJson(T object) {
    // This will only work if `object` is a native JSON type:
    //   num, String, bool, null, etc
    // Or if it has a `toJson()` function`.
    return object;
  }
}