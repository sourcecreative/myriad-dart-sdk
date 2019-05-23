import 'package:json_annotation/json_annotation.dart';

import 'rule.dart';
import 'paginated_response.dart';

part 'tier.g.dart';

@JsonSerializable(includeIfNull: false)
class Tier {
  String name;
  String description;
  List<Rule> rules;
  Map<String, dynamic> metadata;

  Tier(this.name, this.rules, {this.description, metadata})
    : this.metadata = metadata ?? <String, dynamic>{};

  factory Tier.fromJson(Map<String, dynamic> json) => _$TierFromJson(json);
  Map<String, dynamic> toJson() => _$TierToJson(this);  
}

@JsonSerializable(includeIfNull: false)
class TierResponse {
  String campaignId;
  String id;
  String name;
  String description;
  List<RuleResponse> rules;
  Map<String, dynamic> metadata;

  TierResponse(this.id, this.name, this.rules, {this.description, Map<String,dynamic> metadata})
    : this.metadata = metadata ?? <String,dynamic>{};

  factory TierResponse.fromJson(Map<String, dynamic> json) => _$TierResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TierResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$TierResponseFromJson;

}

@JsonSerializable(includeIfNull: false)
class PaginatedTierResponse extends PaginatedResponse<TierResponse> {
  PaginatedTierResponse(List<TierResponse> entries, int total, { int page=1, int size=20}) 
    : super(entries, total, page:page, size:size);

 factory PaginatedTierResponse.fromJson(Map<String, dynamic> json) => _$PaginatedTierResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedTierResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$PaginatedTierResponseFromJson;

}