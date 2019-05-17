import 'package:json_annotation/json_annotation.dart';

import 'response.dart';
import 'rule_response.dart';
import '../voucher_config.dart';

part 'voucher_response.g.dart';

enum VoucherStatus {
  ISSUED, DISTRIBUTED, REDEEMED, DISABLED
}

@JsonSerializable(includeIfNull: false)
class VoucherResponse<T> extends TypedResponse {
  String id;
  DateTime updatedAt;
  String campaignId;
  String code;
  VoucherStatus status;
  int redeemedQuantity;
  @VoucherConfigConverter()
  T config;
  //CustomerResponse customer;

  List<RuleResponse> rules;
  Map<String, dynamic> metadata;

  VoucherResponse() : super('VoucherResponse');
  
  factory VoucherResponse.fromJson(Map<String, dynamic> json) => _$VoucherResponseFromJson<T>(json);
  Map<String, dynamic> toJson() => _$VoucherResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$VoucherResponseFromJson;

}

@JsonSerializable(includeIfNull: false)
class PaginatedVoucherResponse extends PaginatedResponse<VoucherResponse> {
  PaginatedVoucherResponse(List<VoucherResponse> entries, int total, { int page=1, int size=20}) 
    : super("PaginatedVoucherResponse",entries, total, page:page, size:size);

  factory PaginatedVoucherResponse.fromJson(Map<String, dynamic> json) => _$PaginatedVoucherResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedVoucherResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$PaginatedVoucherResponseFromJson;
}

@JsonSerializable(includeIfNull: false)
class ImportVoucherResponse extends TypedResponse {
  int count;
  int imported;

  ImportVoucherResponse() : super("ImportVoucherResponse");

  factory ImportVoucherResponse.fromJson(Map<String, dynamic> json) => _$ImportVoucherResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ImportVoucherResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$ImportVoucherResponseFromJson;
  
}