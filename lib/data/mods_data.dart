import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:minecraft_bugsmakers/models/category_model.dart';
import 'package:minecraft_bugsmakers/resources/app_links.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class ModsData {
  final _dio = Dio();

  Future<List<CategoryModel>> getAllCategories() async {
    final response = await _dio.get('${AppLinks.apiSource}bugsmakers.json');

    final rawData = List<Map<String, dynamic>>.from(response.data);
    return rawData.map((e) => CategoryModel.fromMap(e)).toList();
  }

  static Future<File?> getPathToNewFile({required String url}) async {
    try {
      final Directory dir = await getTemporaryDirectory();
      final File file = File('${dir.path}/${url.split('/').last}');
      return file;
    } on Exception catch (error) {
      log(error.toString());
      return null;
    }
  }

  static Future<void> openDownloadedFile({required File file}) async {
    try {
      await OpenFile.open(
        file.path,
        type: 'application/x-zip-compressed',
        uti: 'com.mojang.minecraftpe.addon',
      );
    } on Exception catch (error) {
      log(error.toString());
    }
  }

  static Future<void> downloadMod({
    required String link,
    required File file,
    required Function(int count, int total) onProgress,
  }) async {
    try {
      await Dio().download(link, file.path, onReceiveProgress: onProgress);
    } on Exception catch (error) {
      log(error.toString());
    }
  }
}
