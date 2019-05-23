import 'package:http/http.dart' as http;
import 'package:chopper/chopper.dart';

import 'package:myriad_dart_sdk/src/converter/myriad_converter.dart';
import 'package:myriad_dart_sdk/src/service/campaign_service.dart';

import 'package:myriad_dart_sdk/src/service/promotion_service.dart';
import 'package:myriad_dart_sdk/src/service/rule_service.dart';
import 'package:myriad_dart_sdk/src/service/validation_service.dart';
import 'package:myriad_dart_sdk/src/service/voucher_service.dart';

class ConnectionOptions {
  static const String HTTP_HEADER_APP_ID = 'x-app-id';
  static const String HTTP_HEADER_APP_TOKEN = 'x-app-token';
  static const String HTTP_HEADER_MYRIAD_CHANNEL = 'x-myriad-channel';

  String baseUrl = "https://myriad-api.sourcecreative.io/";
  final String _appId;
  final String _appSecret;

  ConnectionOptions(this.baseUrl, {String appId, String appSecret})
    : this._appId = appId, 
      this._appSecret = appSecret;

}

class MyriadClient {
  // static final Map<String, MyriadClient> _cache = <String, MyriadClient>{};
  final String _name;
  final ChopperClient _chopper;

  MyriadClient._internal(this._name, this._chopper);

  factory MyriadClient.build(ConnectionOptions options,{http.Client httpClient}) {
    // if (_cache.containsKey(options.baseUrl))
    //   return _cache[options.baseUrl];
    // else {
      final client = MyriadClient._internal(options.baseUrl,
        ChopperClient(
          client: httpClient,
          converter: myriadConverter,
          errorConverter: myriadConverter,
          baseUrl: options.baseUrl,
          services:[
            CampaignService.newInstance(),
            VoucherService.newInstance(),
            TierService.newInstance(),
            RuleService.newInstance(),
            ValidationService.newInstance()
          ],
          interceptors: [
            HttpLoggingInterceptor(),
            HeadersInterceptor({
              ConnectionOptions.HTTP_HEADER_APP_ID: options._appId,
              ConnectionOptions.HTTP_HEADER_APP_TOKEN: options._appSecret,
              ConnectionOptions.HTTP_HEADER_MYRIAD_CHANNEL: 'Myriad-Dart-SDK'
            })
          ]
        )
      );
      // _cache[options.baseUrl] = client;
      return client;
    //}
  }

  // helper methods for services
  CampaignService get campaigns => _chopper.getService<CampaignService>();
  VoucherService get vouchers => _chopper.getService<VoucherService>();
  TierService get promotions => _chopper.getService<TierService>();
  RuleService get rules => _chopper.getService<RuleService>();
  ValidationService get validations => _chopper.getService<ValidationService>();
}



