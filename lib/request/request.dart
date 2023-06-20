import 'dart:convert';

import 'package:dio/dio.dart';
import './init_dio.dart';

class Request{
  Future requset(String path, Map<String,dynamic> data, String method) async {
    Response res =await initDio().request(
      path,
      options: Options(method: method),
      data: data,
      queryParameters: data,
    );
    final jsonData = jsonDecode(res.toString());
    return jsonData;

  }
  Future get(String path, {Map<String,dynamic> data = const{}}) {

    return requset(path,data,'get');
  }
  Future post(String path, {Map<String,dynamic> data = const{}}) {
    return requset(path,data,'post');

  }
  Future put(String path, {Map<String,dynamic> data = const{}}) {
    return requset(path,data,'put');
  }

}

//这段代码定义了一个Request类，其中包含了使用Dio库发送请求的一些方法。
//
// request方法是一个通用的请求方法，接收路径path、数据data和请求方法method作为参数。它使用initDio()方法创建的Dio实例来发送请求，并返回响应数据。
//
// get方法使用request方法发送GET请求，接收路径path和可选的数据data作为参数。
//
// post方法使用request方法发送POST请求，接收路径path和可选的数据data作为参数。
//
// put方法使用request方法发送PUT请求，接收路径path和可选的数据data作为参数。
//
// 这个Request类的设计使得发送请求变得更加简单和可扩展。你可以使用get、post和put方法来发送对应的请求，而不需要手动创建Dio实例和设置请求选项。
//
//