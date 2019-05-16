import 'package:json_annotation/json_annotation.dart';

import 'rule.dart';

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