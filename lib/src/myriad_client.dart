import 'package:dio/dio.dart';

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

abstract class MyriadConnection {
  Future<Response<T>> post<T>(String path, {dynamic data, Map<String, dynamic> queryParams});
}

class _MyriadClientConnection extends MyriadConnection {
  Dio _dio;

  _MyriadClientConnection(this._dio);

  @override
  Future<Response<T>> post<T>(String path, {data, Map<String, dynamic> queryParams}) {
    return _dio.post(path, data:data, queryParameters:queryParams);
  }
  
}

class MyriadClient {
  static final MyriadClient _instance = MyriadClient._internal();  

  factory MyriadClient() {
    return _instance;
  }

  MyriadClient._internal();

  MyriadConnection connect(ConnectionOptions options) {
    Dio _dio = Dio(BaseOptions(receiveTimeout: 5000, connectTimeout: 5000));
    _dio.options.baseUrl = options.baseUrl;
    _setupInterceptors(_dio, options);
    return _MyriadClientConnection(_dio);
  }

  _setupInterceptors(Dio dio, ConnectionOptions connectionOptions) {
    // add interceptor to set headers
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options){
        options.headers[ConnectionOptions.HTTP_HEADER_APP_ID] = connectionOptions._appId;
        options.headers[ConnectionOptions.HTTP_HEADER_APP_TOKEN] = connectionOptions._appSecret;
        options.headers[ConnectionOptions.HTTP_HEADER_MYRIAD_CHANNEL] = 'Dart-SDK';
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
    dio.interceptors.add(LogInterceptor(responseBody: false));
  }

}
