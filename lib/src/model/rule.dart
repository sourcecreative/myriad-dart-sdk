import 'package:json_annotation/json_annotation.dart';
import 'package:quiver/core.dart';

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