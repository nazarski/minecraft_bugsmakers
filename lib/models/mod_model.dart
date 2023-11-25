import 'package:minecraft_bugsmakers/models/download_model.dart';
import 'package:minecraft_bugsmakers/models/how_to_use_item_model.dart';
import 'package:minecraft_bugsmakers/resources/app_links.dart';

class ModModel {
  final int id;
  final String title;
  final String description;
  final String preview;
  final List<HowToUseItemModel> howToUse;
  final bool isVip;
  final List<DownloadModel> modsPath;

  ModModel({
    required this.id,
    required this.title,
    required this.description,
    required this.preview,
    required this.howToUse,
    required this.modsPath,
    this.isVip = false,
  });

  factory ModModel.fromMap(Map<String, dynamic> map) {
    return ModModel(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      preview: AppLinks.apiSource + map['preview'],
      howToUse: (map['howToUse'] as List<dynamic>)
          .map((e) => HowToUseItemModel
          .fromMap(e))
          .toList(),
      isVip: map['is_vip'] ??= false,
      modsPath: (map['modsPath'] as List<dynamic>)
          .map((e) => DownloadModel
          .fromMap(e))
          .toList(),
    );
  }
}
