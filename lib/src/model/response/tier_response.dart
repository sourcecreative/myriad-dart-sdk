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

  factory TierResponse.fromJson(Map<String, dynamic> json) => _$TierResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TierResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$TierResponseFromJson;

}