import 'package:json_annotation/json_annotation.dart';

import 'voucher_config.dart';

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