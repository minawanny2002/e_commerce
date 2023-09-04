import 'package:dio/dio.dart';

class DioHelper {
  final Dio dio = Dio();

  Future<List> getProducts() async {

    Response response = await dio.get('https://dummyjson.com/products');
    return response.data["products"];
  }
}