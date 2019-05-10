import 'package:json_annotation/json_annotation.dart';
import 'package:quiver/core.dart';

part 'code_config.g.dart';

@JsonSerializable(includeIfNull: false)
class CodeConfig {
  static const ALPHABETIC = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static const ALPHANUMERIC = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static const NUMBERS = '0123456789';

  int length = 8;
  String charset = NUMBERS;
  String prefix;
  String postfix;
  String pattern;

  CodeConfig({this.length,this.charset,this.pattern,this.prefix,this.postfix});
  factory CodeConfig.fromJson(Map<String, dynamic> json) => _$CodeConfigFromJson(json);
  Map<String, dynamic> toJson() => _$CodeConfigToJson(this);

  bool operator == (other) => 
    other is CodeConfig && other.length == length && other.charset == charset &&
    other.prefix == prefix && other.postfix == postfix && other.pattern == pattern;

  int get hashCode => hashObjects([length,charset,prefix,postfix,pattern]);
}