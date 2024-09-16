import '../../domain/entities/UserTodo_entity.dart';

class UserTodoModel extends UserTodoEntity {
  UserTodoModel({required this.id,  this.name, super.rawJson});

  factory UserTodoModel.fromJson(Map<String, dynamic> json) {
    return UserTodoModel(
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
