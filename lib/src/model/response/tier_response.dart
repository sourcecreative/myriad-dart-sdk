import 'package:json_annotation/json_annotation.dart';

import 'response.dart';
import 'rule_response.dart';

part 'tier_response.g.dart';

@JsonSerializable(includeIfNull: false)
class TierResponse extends TypedResponse {
  String id;
  String name;
  String description;
  List<RuleResponse> rules;
  Map<String, dynamic> metadata;

  TierResponse(this.id, this.name, this.rules, {this.description, Map<String,dynamic> metadata})
    : this.metadata = metadata ?? <String,dynamic>{},
      super('TierResponse') ;
  TierResponse._create(String objType) : super(objType);

  factory TierResponse.fromJson(Map<String, dynamic> json) => _$TierResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TierResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$TierResponseFromJson;

}

@JsonSerializable(includeIfNull: false)
class PromotionTierResponse extends TierResponse {
  String campaignId;
  PromotionTierResponse(this.campaignId) : super._create('PromotionTierResponse');
  
  factory PromotionTierResponse.fromJson(Map<String, dynamic> json) => _$PromotionTierResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PromotionTierResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$PromotionTierResponseFromJson;
}

@JsonSerializable(includeIfNull: false)
class PaginatedTierResponse extends PaginatedResponse<TierResponse> {
  PaginatedTierResponse(List<TierResponse> entries, int total, { int page=1, int size=20}) 
    : super("PaginatedTierResponse",entries, total, page:page, size:size);

 factory PaginatedTierResponse.fromJson(Map<String, dynamic> json) => _$PaginatedTierResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedTierResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$PaginatedTierResponseFromJson;

}