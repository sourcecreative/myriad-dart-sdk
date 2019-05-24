// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'segment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Segment _$SegmentFromJson(Map<String, dynamic> json) {
  return Segment()
    ..name = json['name'] as String
    ..type = _$enumDecodeNullable(_$SegmentTypeEnumMap, json['type'])
    ..metadata = json['metadata'] as Map<String, dynamic>
    ..customers = (json['customers'] as List)?.map((e) => e as String)?.toList()
    ..filters = (json['filters'] as List)
        ?.map(
            (e) => e == null ? null : Rule.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SegmentToJson(Segment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('type', _$SegmentTypeEnumMap[instance.type]);
  writeNotNull('metadata', instance.metadata);
  writeNotNull('customers', instance.customers);
  writeNotNull('filters', instance.filters);
  return val;
}

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

T _$enumDecodeNullable<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source);
}

const _$SegmentTypeEnumMap = <SegmentType, dynamic>{
  SegmentType.STATIC: 'STATIC',
  SegmentType.AUTO: 'AUTO'
};

SegmentResponse _$SegmentResponseFromJson(Map<String, dynamic> json) {
  return SegmentResponse()
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..type = _$enumDecodeNullable(_$SegmentTypeEnumMap, json['type'])
    ..metadata = json['metadata'] as Map<String, dynamic>
    ..customers = (json['customers'] as List)
        ?.map((e) => e == null
            ? null
            : CustomerResponse.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..filters = (json['filters'] as List)
        ?.map((e) =>
            e == null ? null : RuleResponse.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$SegmentResponseToJson(SegmentResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('type', _$SegmentTypeEnumMap[instance.type]);
  writeNotNull('metadata', instance.metadata);
  writeNotNull('customers', instance.customers);
  writeNotNull('filters', instance.filters);
  return val;
}

PaginatedSegmentResponse _$PaginatedSegmentResponseFromJson(
    Map<String, dynamic> json) {
  return PaginatedSegmentResponse(
      (json['entries'] as List)
          ?.map((e) => e == null
              ? null
              : SegmentResponse.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['total'] as int,
      page: json['page'] as int,
      size: json['size'] as int);
}

Map<String, dynamic> _$PaginatedSegmentResponseToJson(
    PaginatedSegmentResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('total', instance.total);
  writeNotNull('page', instance.page);
  writeNotNull('size', instance.size);
  writeNotNull('entries', instance.entries);
  return val;
}
