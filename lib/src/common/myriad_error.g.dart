// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myriad_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyriadError _$MyriadErrorFromJson(Map<String, dynamic> json) {
  return MyriadError(json['errorCode'] as int, json['error'] as String);
}

Map<String, dynamic> _$MyriadErrorToJson(MyriadError instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('error', instance.error);
  writeNotNull('errorCode', instance.errorCode);
  return val;
}
