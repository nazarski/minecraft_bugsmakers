import 'package:minecraft_bugsmakers/models/download_model.dart';
import 'package:minecraft_bugsmakers/resources/app_links.dart';

class ModModel {
  final int id;
  final String title;
  final String description;
  final String preview;
  final String howToUse;
  final bool isVip;
  final List<DownloadModel> modsPath;

  ModModel({
    required this.id,
    required this.title,
    required this.description,
    required this.preview,
    required this.howToUse,
    required this.modsPath,
    required this.isVip,
  });

  factory ModModel.fromMap(Map<String, dynamic> map) {
    return ModModel(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      preview: AppLinks.apiSource + map['preview'],
      howToUse: map['howToUse'] as String,
      isVip: map['is_vip'] as bool,
      modsPath:( map['modsPath'] as List<dynamic>).map((e) {
        final DownloadModel model = DownloadModel.fromMap(e);
        return model;
      }).toList(),
    );
  }
}
