import 'package:json_annotation/json_annotation.dart';
import 'package:quiver/core.dart';

part 'rule_response.g.dart';

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

  bool operator == (o) => o is RuleResponse && o.name == name && o.description == description
    && o.condition == condition && o.action == action && o.priority == priority;

  int get hashCode => hashObjects([name,description,condition,action,priority]);

}