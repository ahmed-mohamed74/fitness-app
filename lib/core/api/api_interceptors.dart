import 'package:dio/dio.dart';

class ApiInterceptors extends Interceptor {
    @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers['Authorization']='Bearer ${CacheHelper().getData(key: ApiKey.token)}';
    super.onRequest(options, handler);
  }
}