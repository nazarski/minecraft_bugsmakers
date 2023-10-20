import 'package:dio/dio.dart';
import 'package:minecraft_bugsmakers/models/category_model.dart';

class ModsData {
  final _dio = Dio();

  Future<List<CategoryModel>> getAllCategories() async {
    final response =
        await _dio.get('http://pidruchniky.com.ua/jsonbugs/bugsmakers'
            '.json');

    final rawData = List<Map<String, dynamic>>.from(response.data);
    return rawData.map((e) => CategoryModel.fromMap(e)).toList();
  }
}
