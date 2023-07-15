import 'package:bloc_tutorial1/model/model.dart';
import 'package:dio/dio.dart';

class GetCatRepo{
  final Dio dio;

  GetCatRepo({required this.dio});

  Future<List<Model>> getCatsData() async{
    final response = await dio.get("/search?limit=1");
    final result = (response.data as List).map((e) => Model.fromJson(e)).toList();
    return result;
  }
}