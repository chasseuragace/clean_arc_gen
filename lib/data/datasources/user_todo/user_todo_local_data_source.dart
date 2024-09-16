import '../../models/UserTodo_model.dart';

abstract class UserTodoLocalDataSource {
  Future<List<UserTodoModel>> getAllItems();
  Future<UserTodoModel?> getItemById(String id);
  Future<void> addItem(UserTodoModel model);
  Future<void> updateItem(UserTodoModel model);
  Future<void> deleteItem(String id);
}

class UserTodoLocalDataSourceImpl implements UserTodoLocalDataSource {
  @override
  Future<List<UserTodoModel>> getAllItems() async {
   throw UnimplementedError();
  }

  @override
  Future<UserTodoModel?> getItemById(String id) async {
    // Implementation
  }

  @override
  Future<void> addItem(UserTodoModel model) async {
    // Implementation
  }

  @override
  Future<void> updateItem(UserTodoModel model) async {
    // Implementation
  }

  @override
  Future<void> deleteItem(String id) async {
    // Implementation
  }
}
