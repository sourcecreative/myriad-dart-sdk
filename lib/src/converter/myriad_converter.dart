import 'package:chopper/chopper.dart';
import 'package:myriad_dart_sdk/src/model/campaign.dart';
import 'package:myriad_dart_sdk/src/model/customer.dart';
import 'package:myriad_dart_sdk/src/model/distribution.dart';
import 'package:myriad_dart_sdk/src/model/order.dart';
import 'package:myriad_dart_sdk/src/model/rule.dart';
import 'package:myriad_dart_sdk/src/model/segment.dart';
import 'package:myriad_dart_sdk/src/model/tier.dart';
import 'package:myriad_dart_sdk/src/model/validation.dart';
import 'package:myriad_dart_sdk/src/model/voucher.dart';

import '../common/myriad_error.dart';

//typedef JsonDeserialize<T> = T Function(Map<String,dynamic> json);
typedef T JsonDeserialize<T>(Map<String, dynamic> json);

class MyriadConverter extends JsonConverter {
  final Map<String, JsonDeserialize> registry;

  MyriadConverter(this.registry);

  T _decodeMap<T>(Map<String, dynamic> json) {
    /// Get deserializer from registry - we may need a deserializer for a subclass of T
    /// if not found or invalid, throw error
    var objType = json['objType']??T.toString();
    final deserialize = registry[objType];
    if (deserialize == null || deserialize is! JsonDeserialize) {
      /// throw serializer not found error;
      throw NoJsonSerializerError(T, objType);
    }
    
    return deserialize(json);
  }

  List<T> _decodeList<T>(List values) =>
      values.where((v) => v != null).map<T>((v) => _decode<T>(v)).toList();

  dynamic _decode<T>(entity) {
    if (entity is Iterable) return _decodeList<T>(entity);

    if (entity is Map) return _decodeMap<T>(entity);

    return entity;
  }

  @override
  Response<ResultType> convertResponse<ResultType, Item>(Response response) {
    // use JsonConverter to convert response
    final jsonRes = super.convertResponse(response);
    // deserialize and replace the response body
    return jsonRes.replace<ResultType>(body: _decode<Item>(jsonRes.body));
  }

  @override
  // all objects should implements toJson method
  Request convertRequest(Request request) => super.convertRequest(request);

  Response convertError<ResultType, Item>(Response response) {
    // use [JsonConverter] to decode json
    final jsonRes = super.convertError(response);

    return jsonRes.replace<MyriadError>(
      body: MyriadError.fromJson(jsonRes.body)
    );
  }
}

class NoJsonSerializerError extends Error {
  /// The exception thrown when trying to convert the object.
  final Type unsupportedType;
  final String objType;

  NoJsonSerializerError(this.unsupportedType, [this.objType]);

  String toString() {
    var safeString = objType??Error.safeToString(unsupportedType);
    String prefix = "Type has no suitable deserializer:";
    return "$prefix $safeString";
  }

}

/// register response deserializers
final myriadConverter = MyriadConverter(
  {
    "BatchUpdateCustomerResponse": BatchUpdateCustomerResponse.deserialize,
    "CustomerResponse": CustomerResponse.deserialize, 
    "DistributeBatchVouchersResponse": DistributeBatchVouchersResponse.deserialize,
    "ImportVoucherResponse": ImportVoucherResponse.deserialize,
    "LoyaltyProgramResponse": LoyaltyProgramResponse.deserialize,
    "OrderResponse": OrderResponse.deserialize,
    "PaginatedCampaignResponse": PaginatedCampaignResponse.deserialize,
    "PaginatedCustomerResponse": PaginatedCustomerResponse.deserialize,            
    "PaginatedLoyaltyResponse": PaginatedLoyaltyResponse.deserialize,
    "PaginatedOrderResponse": PaginatedOrderResponse.deserialize,
    "PaginatedPromotionResponse": PaginatedPromotionResponse.deserialize,
    "PaginatedRuleAssignmentResponse": PaginatedRuleAssignmentResponse.deserialize,
    "PaginatedRuleResponse": PaginatedRuleResponse.deserialize,
    "PaginatedSegmentResponse": PaginatedSegmentResponse.deserialize,
    "PaginatedTierResponse": PaginatedTierResponse.deserialize,
    "PaginatedVoucherDistributionResponse": PaginatedVoucherDistributionResponse.deserialize,
    "PaginatedVoucherResponse": PaginatedVoucherResponse.deserialize,
    "PromotionCampaignResponse": PromotionCampaignResponse.deserialize,
    "PromotionRedemptionResponse": PromotionRedemptionResponse.deserialize,
    "PromotionValidationResponse": PromotionValidationResponse.deserialize,
    "RuleAssignmentResponse": RuleAssignmentResponse.deserialize,
    "RuleResponse": RuleResponse.deserialize,
    "SegmentResponse": SegmentResponse.deserialize,
    "TierResponse": TierResponse.deserialize,
    "VoucherCampaignResponse<dynamic>": VoucherCampaignResponse.deserialize,
    "VoucherDistributionResponse": VoucherDistributionResponse.deserialize,
    "VoucherRedemptionResponse<dynamic>": VoucherRedemptionResponse.deserialize,
    "VoucherResponse<dynamic>": VoucherResponse.deserialize,
    "VoucherValidationResponse<dynamic>": VoucherValidationResponse.deserialize,

  }
);