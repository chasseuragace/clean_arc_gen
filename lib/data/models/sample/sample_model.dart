import '../../../domain/entities/sample/sample_entity.dart';

class SampleModel extends SamplEntity {
  SampleModel({required this.id, required this.name, super.rawJson});

  factory SampleModel.fromJson(Map<String, dynamic> json) {
    return SampleModel(
      id: json['id'] as String,
      name: json['name'] as String,
      rawJson: json, // Pass the entire JSON object
    );
  }
  final String id;
  final String name;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
