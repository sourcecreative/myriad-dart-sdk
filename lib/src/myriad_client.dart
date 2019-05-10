import 'package:dio/dio.dart';

import './repository/campaign_api_provider.dart';
import './repository/campaign_repository.dart';
import './service/campaign_service.dart';

class ConnectionConfig {
  static const String HTTP_HEADER_APP_ID = 'x-app-id';
  static const String HTTP_HEADER_APP_TOKEN = 'x-app-token';
  static const String HTTP_HEADER_MYRIAD_CHANNEL = 'x-myriad-channel';

  String baseUrl = "https://myriad-api.sourcecreative.io/";
  final String appId;
  final String appSecret;

  ConnectionConfig(this.baseUrl, [this.appId, this.appSecret]);
}

class MyriadClient {
  static final MyriadClient _instance = MyriadClient._internal();
  
  Dio _dio;
  ConnectionConfig _config;

  Map<String, dynamic> _services = Map<String, dynamic>();

  CampaignService get campaigns => _services[CampaignService.KEY];

  factory MyriadClient() {
    return _instance;
  }

  MyriadClient._internal() {
    _dio = Dio(BaseOptions(receiveTimeout: 5000, connectTimeout: 5000));
    _registerServices();
  }

  connect(ConnectionConfig config) {
    this._config = config;
    _dio.options.baseUrl = _config.baseUrl;
    _setupInterceptors(_config);
  }

  _registerServices() {
    _services.putIfAbsent(CampaignService.KEY, () => CampaignService(CampaignRepository(CampaignApiProvider(_dio))));
  }

  _setupInterceptors(ConnectionConfig cfg) {
    // add interceptor to set headers
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options){
        options.headers[ConnectionConfig.HTTP_HEADER_APP_ID] = cfg.appId;
        options.headers[ConnectionConfig.HTTP_HEADER_APP_TOKEN] = cfg.appSecret;
        options.headers[ConnectionConfig.HTTP_HEADER_MYRIAD_CHANNEL] = 'Dart-SDK';
        return options;
      },
      onResponse:(Response response) {
        // Do something with response data
        int statusCode = response.statusCode;
        if (statusCode >= 100 && statusCode < 300)
          return response; // continue
        return new DioError(message: response.data['errorMsg']);  
      },
      onError: (DioError e) {
        // Do something with response error
        return  e;//continue
      }
    ));
    
    // add logging interceptor
    _dio.interceptors.add(LogInterceptor(responseBody: false));
  }

}
