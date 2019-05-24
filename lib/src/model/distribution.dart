import 'package:json_annotation/json_annotation.dart';
import 'package:myriad_dart_sdk/src/model/paginated_response.dart';
import 'package:myriad_dart_sdk/src/model/segment.dart';
import 'package:myriad_dart_sdk/src/model/voucher.dart';

import 'customer.dart';

part 'distribution.g.dart';

enum Channel {
  API, SMS, EMAIL, WALLET
}

@JsonSerializable(includeIfNull: false)
class DistributeVoucher {
  // auto-generate a voucher for distribution if voucherId is null
  String voucherId;
  Channel channel;
  Customer customer;
  Map<String,dynamic> metadata;

  DistributeVoucher(this.customer, {this.voucherId, this.channel = Channel.API, 
    this.metadata = const <String,dynamic>{}});

  factory DistributeVoucher.fromJson(Map<String, dynamic> json) => _$DistributeVoucherFromJson(json);
  Map<String, dynamic> toJson() => _$DistributeVoucherToJson(this);

}

@JsonSerializable(includeIfNull: false)
class VoucherDistributionResponse {
  String id;
  CustomerResponse customer;
  VoucherResponse voucher;
  Channel channel;

  VoucherDistributionResponse(this.id, this.voucher, this.customer, {this.channel = Channel.API});

  factory VoucherDistributionResponse.fromJson(Map<String, dynamic> json) => _$VoucherDistributionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$VoucherDistributionResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$VoucherDistributionResponseFromJson;
}

@JsonSerializable(includeIfNull: false)
class PaginatedVoucherDistributionResponse extends PaginatedResponse<VoucherDistributionResponse> {
  PaginatedVoucherDistributionResponse(List<VoucherDistributionResponse> entries, int total, { int page=1, int size=20}) 
    : super(entries, total, page:page, size:size);

 factory PaginatedVoucherDistributionResponse.fromJson(Map<String, dynamic> json) 
    => _$PaginatedVoucherDistributionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaginatedVoucherDistributionResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$PaginatedVoucherDistributionResponseFromJson;

}

@JsonSerializable(includeIfNull: false)
class DistributeBatchVouchers {
  Channel channel;
  String segmentId;
  Map<String,dynamic> metadata;
  // voucher count per customer
  int countPerCustomer;

  DistributeBatchVouchers(this.segmentId,{this.channel = Channel.API, this.countPerCustomer = 1, 
    this.metadata=const <String,dynamic>{}});

  factory DistributeBatchVouchers.fromJson(Map<String, dynamic> json) => _$DistributeBatchVouchersFromJson(json);
  Map<String, dynamic> toJson() => _$DistributeBatchVouchersToJson(this);

}

@JsonSerializable(includeIfNull: false)
class DistributeBatchVouchersResponse {
  Channel channel;
  SegmentResponse segment;
  // total vouchers to be distributed
  int total;

  DistributeBatchVouchersResponse(this.segment, this.total, {this.channel = Channel.API});

  factory DistributeBatchVouchersResponse.fromJson(Map<String, dynamic> json) => _$DistributeBatchVouchersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DistributeBatchVouchersResponseToJson(this);

  static const dynamic Function(Map<String, dynamic>) deserialize = _$DistributeBatchVouchersResponseFromJson;

}