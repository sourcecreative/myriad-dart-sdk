import 'package:json_annotation/json_annotation.dart';
import 'package:quiver/core.dart';

part 'currency.g.dart';

@JsonSerializable(includeIfNull: false)
class Currency {
  static const USD = Currency('USD',2);
  static const RMB = Currency("RMB", 2);
  
  final String symbol;
  final int precision;

  const Currency(this.symbol, this.precision);
  factory Currency.fromJson(Map<String, dynamic> json) => _$CurrencyFromJson(json);
  Map<String, dynamic> toJson() => _$CurrencyToJson(this);

  bool operator == (o) => o is Currency && o.symbol == symbol && o.precision == precision;
  int get hashCode => hash2(symbol,precision);
}