import 'package:json_annotation/json_annotation.dart';

import 'voucher_config.dart';
import 'response.dart';
import 'rule.dart';

part 'voucher.g.dart';

@JsonSerializable(includeIfNull: false)
class Voucher<T extends VoucherConfig> {
  // voucher code - if not specified, server will generate a code based on code config
  String code;
  @VoucherConfigConverter()
  T config;
  Map<String, dynamic> metadata;
  String category;

  Voucher(this.config,{this.code, Map<String, dynamic> metadata})
    : this.metadata = metadata ?? <String,dynamic>{};

  factory Voucher.fromJson(Map<String, dynamic> json) => _$VoucherFromJson(json);
  Map<String, dynamic> toJson() => _$VoucherToJson(this);
  
}

@JsonSerializable(includeIfNull: false)
class UpdateVoucher {
  String category;
  DateTime effective;
  DateTime expiry;
  Map<String, dynamic> metadata;

  UpdateVoucher({this.category,this.effective,this.expiry,this.metadata});

  factory UpdateVoucher.fromJson(Map<String, dynamic> json) => _$UpdateVoucherFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateVoucherToJson(this);
}


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