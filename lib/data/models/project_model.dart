import '../../domain/entities/Project_entity.dart';

class ProjectModel extends ProjectEntity {
  ProjectModel({required this.id,  this.name, super.rawJson});

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
       id: json['id'] as String,
        name: json['name'] as String?,
        rawJson: json, // Pass the entire JSON object
      );
  }
  final String id;
  final String? name;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
