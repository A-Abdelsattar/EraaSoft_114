
import 'package:dio/dio.dart';
import 'package:movie_114/core/services/end_points.dart';

class ApiServices{
  static Dio? dio;

  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl
      )
    );
  }

 static Future<Response> getData({required String url})async{
    return await dio!.get(url,queryParameters:{
      "api_key":"a674e3861f0ebf3d4563910dbabfbda5"
    } );
  }
}