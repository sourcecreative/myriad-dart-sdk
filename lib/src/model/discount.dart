import 'package:json_annotation/json_annotation.dart';
import 'package:quiver/core.dart';

part 'discount.g.dart';

enum DiscountType {
	AMOUNT, PERCENT, UNIT
}

abstract class Discount {
  DiscountType type;
  Discount(this.type);

  bool operator == (other) => other is Discount && other.type == type;
  int get hashCode => type.hashCode;
}

@JsonSerializable(includeIfNull: false)
class AmountDiscount extends Discount {
  int amountOff;
  AmountDiscount(this.amountOff): super(DiscountType.AMOUNT);
  factory AmountDiscount.fromJson(Map<String, dynamic> json) => _$AmountDiscountFromJson(json);
  Map<String, dynamic> toJson() => _$AmountDiscountToJson(this);

  bool operator == (other) => other is AmountDiscount && other.type == type && other.amountOff == amountOff;
  int get hashCode => hash2(type, amountOff);
}

@JsonSerializable(includeIfNull: false)
class PercentDiscount extends Discount {
  double percentOff;
  PercentDiscount(this.percentOff) : super(DiscountType.PERCENT);
  factory PercentDiscount.fromJson(Map<String, dynamic> json) => _$PercentDiscountFromJson(json);
  Map<String, dynamic> toJson() => _$PercentDiscountToJson(this);

  bool operator == (other) => other is PercentDiscount && other.type == type && other.percentOff == percentOff;
  int get hashCode => hash2(type, percentOff);
}

@JsonSerializable(includeIfNull: false)
class UnitDiscount extends Discount {
  int unitOff;
  String unitType;
  UnitDiscount(this.unitOff, this.unitType) : super(DiscountType.UNIT);
  factory UnitDiscount.fromJson(Map<String, dynamic> json) => _$UnitDiscountFromJson(json);
  Map<String, dynamic> toJson() => _$UnitDiscountToJson(this);

  bool operator == (o) => o is UnitDiscount && o.type == type && o.unitOff == unitOff && o.unitType == unitType;
  int get hashCode => hash3(type, unitOff, unitType);
}