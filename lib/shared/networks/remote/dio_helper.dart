import 'package:dio/dio.dart';

class DioHelper {
  static late Dio _dio;

  static void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
    print('Successfully Created the Dio Helper Instance');
  }

  static Future<Response> getDate({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? tokenID,
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': tokenID ?? '',
    };
    return await _dio.get(
      url,
      queryParameters: query ?? null,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? tokenID,
    Map<String, dynamic>? query,
  }) async {
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': tokenID ?? '',
    };
    return await _dio.post(
      url,
      queryParameters: query ?? null,
      data: data,
    );
  }

//   static void init () {
//     _dio = Dio(
//       BaseOptions(
//         baseUrl: 'https://newsapi.org/',
//         receiveDataWhenStatusError: true,
//       ),
//     );
//     print('Successfully Created the Dio Helper Instance');
//   }
//
//   static Future<Response> getDate ({
//   required String url ,
//     required Map <String , dynamic> query ,
// }) async{
//    return  await _dio.get(url , queryParameters: query);
//   }
}
