import 'package:json_annotation/json_annotation.dart';
import 'package:quiver/core.dart';

import 'paginated_response.dart';

part 'rule.g.dart';

@JsonSerializable(includeIfNull: false)
class Rule {
  String name;
  String description;
  String condition;
  String action;
  int priority;

  Rule(this.name, this.description, this.condition, [this.action, this.priority]);

  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);
  Map<String, dynamic> toJson() => _$RuleToJson(this);

  bool operator == (o) => o is Rule && o.name == name && o.description == description
    && o.condition == condition && o.action == action && o.priority == priority;

  int get hashCode => hashObjects([name,description,condition,action,priority]);

}

@JsonSerializable(includeIfNull: false)
class RuleResponse {
  String id;
  String name;
  String description;
  String condition;
  String action;
  int priority;

  RuleResponse(this.id, this.name, this.description, this.condition, [this.action, this.priority]);

  factory RuleResponse.fromJson(Map<String, dynamic> json) => _$RuleResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RuleResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$RuleResponseFromJson;

  bool operator == (o) => o is RuleResponse && o.name == name && o.description == description
    && o.condition == condition && o.action == action && o.priority == priority;

  int get hashCode => hashObjects([name,description,condition,action,priority]);

}

@JsonSerializable(includeIfNull: false)
class PaginatedRuleResponse extends PaginatedResponse<RuleResponse> {
  PaginatedRuleResponse(List<RuleResponse> entries, int total, { int page=1, int size=20}) 
    : super(entries, total, page:page, size:size);

 factory PaginatedRuleResponse.fromJson(Map<String, dynamic> json) => _$PaginatedRuleResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedRuleResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$PaginatedRuleResponseFromJson;

}