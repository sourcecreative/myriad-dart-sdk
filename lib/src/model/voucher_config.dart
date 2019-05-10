import 'package:json_annotation/json_annotation.dart';
import 'package:quiver/core.dart';

import 'code_config.dart';
import 'discount.dart';

part 'voucher_config.g.dart';

enum VoucherType {
  COUPON, GIFT, PREPAID_CARD, LOYALTY_CARD
}

abstract class VoucherConfig {
  VoucherType type;
  int redemption = 1;
  CodeConfig codeConfig;
  
  VoucherConfig(this.type, CodeConfig codeConfig, [this.redemption])
    : this.codeConfig = codeConfig;
}

@JsonSerializable(includeIfNull: false)
class CouponConfig<T extends Discount> extends VoucherConfig {
  @_DiscountConverter()
  final T discount;

  CouponConfig(CodeConfig codeConfig, this.discount, [int redemption = 1]) 
    : super(VoucherType.COUPON, codeConfig, redemption);
  
  factory CouponConfig.fromJson(Map<String, dynamic> json) => _$CouponConfigFromJson<T>(json);
  Map<String, dynamic> toJson() => _$CouponConfigToJson(this);  

  bool operator == (o) => o is CouponConfig && o.type == type && o.redemption == redemption
    && o.codeConfig == codeConfig && o.discount == discount;

  int get hashCode => hashObjects([type,redemption,codeConfig,discount]);

}

class _DiscountConverter<T> implements JsonConverter<T, Object> {
  const _DiscountConverter();
  @override
  T fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      var strType = json['type'];
      if (strType == _getSimpleName(DiscountType.AMOUNT))
        return AmountDiscount.fromJson(json) as T;
      else if (strType == _getSimpleName(DiscountType.PERCENT))
        return PercentDiscount.fromJson(json) as T;
      else if (strType == _getSimpleName(DiscountType.UNIT))
        return UnitDiscount.fromJson(json) as T;
      else {
        throw Exception("Unknown discount type");
      }
    }
    // This will only work if `json` is a native JSON type:
    //   num, String, bool, null, etc
    // *and* is assignable to `T`.
    return json as T;
  }

  String _getSimpleName(dynamic enumValue) {
    return enumValue.toString().split('.').last;
  }

  @override
  Object toJson(T object) {
    // This will only work if `object` is a native JSON type:
    //   num, String, bool, null, etc
    // Or if it has a `toJson()` function`.
    return object;
  }
}

@JsonSerializable(includeIfNull: false)
class PrepaidCardConfig extends VoucherConfig {
  num amount;
  PrepaidCardConfig(CodeConfig codeConfig, this.amount, [int redemption = 1])
  : super(VoucherType.PREPAID_CARD, codeConfig, redemption);
  factory PrepaidCardConfig.fromJson(Map<String, dynamic> json) => _$PrepaidCardConfigFromJson(json);
  Map<String, dynamic> toJson() => _$PrepaidCardConfigToJson(this);  

  bool operator == (o) => o is PrepaidCardConfig && o.type == type && o.redemption == redemption
    && o.codeConfig == codeConfig && o.amount == amount;
    
  int get hashCode => hashObjects([type,redemption,codeConfig,amount]);

}

@JsonSerializable(includeIfNull: false)
class GiftConfig extends VoucherConfig {
  String product;
  GiftConfig(CodeConfig codeConfig, this.product) 
    : super(VoucherType.GIFT, codeConfig);
  factory GiftConfig.fromJson(Map<String, dynamic> json) => _$GiftConfigFromJson(json);
  Map<String, dynamic> toJson() => _$GiftConfigToJson(this);  

  bool operator == (o) => o is GiftConfig && o.type == type && o.redemption == redemption
    && o.codeConfig == codeConfig && o.product == product;
    
  int get hashCode => hashObjects([type,redemption,codeConfig,product]);
}

class VoucherConfigConverter<T> implements JsonConverter<T, Object> {
  const VoucherConfigConverter();
  @override
  T fromJson(Object json) {
    if (json is Map<String, dynamic>) {
      var voucherType = json['type'];
      if (voucherType == _getSimpleName(VoucherType.COUPON)) 
        return CouponConfig.fromJson(json) as T;
      else if (voucherType == _getSimpleName(VoucherType.GIFT))
        return GiftConfig.fromJson(json) as T;
      else if (voucherType == _getSimpleName(VoucherType.PREPAID_CARD))
        return PrepaidCardConfig.fromJson(json) as T;
      else
        throw Exception("Unknown Voucher Type");  
    }
    // This will only work if `json` is a native JSON type:
    //   num, String, bool, null, etc
    // *and* is assignable to `T`.
    return json as T;
  }

  String _getSimpleName(dynamic enumValue) {
    return enumValue.toString().split('.').last;
  }

  @override
  Object toJson(T object) {
    // This will only work if `object` is a native JSON type:
    //   num, String, bool, null, etc
    // Or if it has a `toJson()` function`.
    return object;
  }
}
