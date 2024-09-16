import '../../../domain/entities/Userlist/entity.dart';

class UserlistModel implements UserlistEntity {
  UserlistModel({required this.id,  this.name,required this.rawJson});

  factory UserlistModel.fromJson(Map<String, dynamic> json) {
    return UserlistModel(
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
 @override
Map rawJson;
}
