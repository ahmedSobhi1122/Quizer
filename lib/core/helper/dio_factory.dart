import 'package:dio/dio.dart';
import 'package:quizer/core/resources/constants.dart';

// const String APPLICATION_JSON = "application/json";
// const String CONTENT_TYPE = "content-type";
// const String ACCEPT = "accept";
// const String AUTHORIZATION = "authorization";
// const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  // final AppPreferences _appPreferences;

  // DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();

    // String language = await _appPreferences.getAppLanguage();
    Map<String, String> headers = {
      // CONTENT_TYPE: APPLICATION_JSON,
      // ACCEPT: APPLICATION_JSON,
      // AUTHORIZATION: Constants.token,
      // DEFAULT_LANGUAGE: language
    };

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
      // responseType: ResponseType.bytes,
      receiveDataWhenStatusError: true,
      receiveTimeout: Constants.apiTimeOut,
      sendTimeout: Constants.apiTimeOut,
    );

    return dio;
  }
}
