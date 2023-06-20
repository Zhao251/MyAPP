import 'package:dio/dio.dart';
import './request.dart';

import 'package:dio/dio.dart';

class ApiService {
  static Dio _dio = Dio();


  static void initialize() {
    // 生成随机令牌

    // 设置基础路径
    _dio.options.baseUrl = 'http://192.168.8.1:9091';

    // 设置全局请求头
    _dio.options.headers['Content-Type'] = 'application/json';

    // 添加拦截器，在请求中添加token
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // 在请求中添加token
        options.headers['Authorization'] = '';

        return handler.next(options);
      },
    ));
  }
  static Dio getDioInstance() {
    return _dio;
  }
}