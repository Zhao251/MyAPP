import 'package:dio/dio.dart';


Dio initDio () {
  BaseOptions _baseoptions = BaseOptions(
    baseUrl: '',
    connectTimeout: Duration(milliseconds: 5000),
    receiveTimeout: Duration(milliseconds: 5000),
  );
  Dio dio = Dio();
  return dio;
}

//这段代码定义了一个名为 initDio 的函数，用于创建和初始化 Dio 实例。
//
// 首先，通过 BaseOptions 构造函数创建一个 BaseOptions 对象 _baseoptions，用于设置 Dio 的基本选项。在这个例子中，设置了 baseUrl 为空字符串，connectTimeout 为 5000 毫秒（5秒），receiveTimeout 也为 5000 毫秒（5秒）。baseUrl 是用于构建完整的请求 URL 的基础地址，而 connectTimeout 和 receiveTimeout 则是设置请求的连接超时和接收超时时间。
//
// 然后，创建一个 Dio 实例，并将 _baseoptions 对象作为参数传递给 Dio 的构造函数。这将使用给定的基本选项初始化 Dio 实例。
//
// 最后，将创建的 Dio 实例返回给调用者。
//
// 通过这个函数，您可以方便地创建一个预先配置好的 Dio 实例，并在需要发送 HTTP 请求时使用该实例。例如，可以在网络请求的代码中调用 initDio() 函数来获取一个已经配置好的 Dio 实例，然后使用该实例发送请求。这样可以避免在每个请求中都创建新的 Dio 实例，并且可以共享相同的基本选项和配置。