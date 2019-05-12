import 'package:json_annotation/json_annotation.dart';

part 'myriad_error.g.dart';

@JsonSerializable(includeIfNull: false)
class MyriadError {
  final String error;
  final int errorCode;

  MyriadError(this.errorCode, this.error);

  factory MyriadError.fromJson(Map<String, dynamic> json) => _$MyriadErrorFromJson(json);
  Map<String, dynamic> toJson() => _$MyriadErrorToJson(this);

}