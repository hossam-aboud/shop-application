
import 'package:dio/dio.dart';

class DioHelper {

  static late Dio _dio ;

  static void init () {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
    print('Successfully Created the Dio Helper Instance');
  }

  static Future<Response> getDate ({
  required String url ,
    required Map <String , dynamic> query ,
}) async{
   return  await _dio.get(url , queryParameters: query);
  }
}