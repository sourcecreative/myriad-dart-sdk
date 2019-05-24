// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distribution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DistributeVoucher _$DistributeVoucherFromJson(Map<String, dynamic> json) {
  return DistributeVoucher(
      json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      voucherId: json['voucherId'] as String,
      channel: _$enumDecodeNullable(_$ChannelEnumMap, json['channel']),
      metadata: json['metadata'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DistributeVoucherToJson(DistributeVoucher instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('voucherId', instance.voucherId);
  writeNotNull('channel', _$ChannelEnumMap[instance.channel]);
  writeNotNull('customer', instance.customer);
  writeNotNull('metadata', instance.metadata);
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

const _$ChannelEnumMap = <Channel, dynamic>{
  Channel.API: 'API',
  Channel.SMS: 'SMS',
  Channel.EMAIL: 'EMAIL',
  Channel.WALLET: 'WALLET'
};

VoucherDistributionResponse _$VoucherDistributionResponseFromJson(
    Map<String, dynamic> json) {
  return VoucherDistributionResponse(
      json['id'] as String,
      json['voucher'] == null
          ? null
          : VoucherResponse.fromJson(json['voucher'] as Map<String, dynamic>),
      json['customer'] == null
          ? null
          : CustomerResponse.fromJson(json['customer'] as Map<String, dynamic>),
      channel: _$enumDecodeNullable(_$ChannelEnumMap, json['channel']));
}

Map<String, dynamic> _$VoucherDistributionResponseToJson(
    VoucherDistributionResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('customer', instance.customer);
  writeNotNull('voucher', instance.voucher);
  writeNotNull('channel', _$ChannelEnumMap[instance.channel]);
  return val;
}

PaginatedVoucherDistributionResponse
    _$PaginatedVoucherDistributionResponseFromJson(Map<String, dynamic> json) {
  return PaginatedVoucherDistributionResponse(
      (json['entries'] as List)
          ?.map((e) => e == null
              ? null
              : VoucherDistributionResponse.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['total'] as int,
      page: json['page'] as int,
      size: json['size'] as int);
}

Map<String, dynamic> _$PaginatedVoucherDistributionResponseToJson(
    PaginatedVoucherDistributionResponse instance) {
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

DistributeBatchVouchers _$DistributeBatchVouchersFromJson(
    Map<String, dynamic> json) {
  return DistributeBatchVouchers(json['segmentId'] as String,
      channel: _$enumDecodeNullable(_$ChannelEnumMap, json['channel']),
      countPerCustomer: json['countPerCustomer'] as int,
      metadata: json['metadata'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DistributeBatchVouchersToJson(
    DistributeBatchVouchers instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('channel', _$ChannelEnumMap[instance.channel]);
  writeNotNull('segmentId', instance.segmentId);
  writeNotNull('metadata', instance.metadata);
  writeNotNull('countPerCustomer', instance.countPerCustomer);
  return val;
}

DistributeBatchVouchersResponse _$DistributeBatchVouchersResponseFromJson(
    Map<String, dynamic> json) {
  return DistributeBatchVouchersResponse(
      json['segment'] == null
          ? null
          : SegmentResponse.fromJson(json['segment'] as Map<String, dynamic>),
      json['total'] as int,
      channel: _$enumDecodeNullable(_$ChannelEnumMap, json['channel']));
}

Map<String, dynamic> _$DistributeBatchVouchersResponseToJson(
    DistributeBatchVouchersResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('channel', _$ChannelEnumMap[instance.channel]);
  writeNotNull('segment', instance.segment);
  writeNotNull('total', instance.total);
  return val;
}
