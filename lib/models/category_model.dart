import 'package:minecraft_bugsmakers/models/mod_model.dart';

class CategoryModel {
  final String title;
  final List<ModModel> modList;

  CategoryModel({
    required this.title,
    required this.modList,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      title: map['title'] as String,
      modList: (map['mods'] as List<dynamic>).map((e) {
        return ModModel.fromMap(e);
      }).toList(),
    );
  }
}
