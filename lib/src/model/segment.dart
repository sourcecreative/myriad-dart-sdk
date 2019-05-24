import 'package:json_annotation/json_annotation.dart';

import 'package:myriad_dart_sdk/src/model/customer.dart';
import 'package:myriad_dart_sdk/src/model/paginated_response.dart';
import 'package:myriad_dart_sdk/src/model/rule.dart';

part 'segment.g.dart';

enum SegmentType {
  STATIC, AUTO
}

@JsonSerializable(includeIfNull: false)
class Segment {
  String name;
  SegmentType type; 
  Map<String,dynamic> metadata;
  // id list of customers if segment type is STATIC
  List<String> customers;
  // list of filters if segment type is AUTO
  List<Rule> filters;

  Segment();

  Segment.staticSegment(this.name,this.customers,{this.metadata=const <String,dynamic>{}})
    : this.type = SegmentType.STATIC;

  Segment.autoSegment(this.name,this.filters,{this.metadata=const <String,dynamic>{}})
    : this.type = SegmentType.AUTO;

  factory Segment.fromJson(Map<String, dynamic> json) => _$SegmentFromJson(json);
  Map<String, dynamic> toJson() => _$SegmentToJson(this);  

}

@JsonSerializable(includeIfNull: false)
class SegmentResponse {
  String id;
  String name;
  SegmentType type; 
  Map<String,dynamic> metadata;
  List<CustomerResponse> customers;
  List<RuleResponse> filters;

  SegmentResponse();

  factory SegmentResponse.fromJson(Map<String, dynamic> json) => _$SegmentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SegmentResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$SegmentResponseFromJson;
}

@JsonSerializable(includeIfNull: false)
class PaginatedSegmentResponse extends PaginatedResponse<SegmentResponse> {
  PaginatedSegmentResponse(List<SegmentResponse> entries, int total, { int page=1, int size=20}) 
    : super(entries, total, page:page, size:size);

 factory PaginatedSegmentResponse.fromJson(Map<String, dynamic> json) => _$PaginatedSegmentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedSegmentResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$PaginatedSegmentResponseFromJson;

}

