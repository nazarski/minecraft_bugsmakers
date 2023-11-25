
import 'package:minecraft_bugsmakers/resources/app_links.dart';

class DownloadModel {
  final String type;
  final String path;

  DownloadModel({
    required this.type,
    required this.path,
  });

  factory DownloadModel.fromMap(Map<String, dynamic> map) {
    return DownloadModel(
      type: map['type'] as String,
      path: AppLinks.apiSource + map['path'],
    );
  }
}
