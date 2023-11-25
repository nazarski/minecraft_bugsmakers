import 'package:minecraft_bugsmakers/resources/app_links.dart';

class HowToUseItemModel {
  final String? description;
  final String? image;
  final String? instructions;

  HowToUseItemModel({
    required this.description,
    required this.image,
    this.instructions,
  });

  factory HowToUseItemModel.fromMap(Map<String, dynamic> map) {
    return HowToUseItemModel(
      description: map['description'] as String?,
      image: map['image'] != null ? AppLinks.apiSource + map['image'] : null,
      instructions: map['instructions'] as String?,
    );
  }
}
