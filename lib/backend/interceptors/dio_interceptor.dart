import 'package:dio/dio.dart';
import 'package:b_im_q/backend/service/Store.dart';

class DioInterceptor extends Interceptor{
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    final access_token = await Store.getToken();
    if(access_token!= null && access_token.isNotEmpty){
      options.headers['Authorization'] = 'Bearer $access_token';
    }
    options.headers['Content-Type'] = 'application/json';

    super.onRequest(options, handler);
  }
}