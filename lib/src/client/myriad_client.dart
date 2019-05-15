import 'package:http/http.dart' as http;
import 'package:chopper/chopper.dart';

import '../converter/myriad_converter.dart';
import '../service/campaign_service.dart';

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
            CampaignService.newInstance()
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

}



