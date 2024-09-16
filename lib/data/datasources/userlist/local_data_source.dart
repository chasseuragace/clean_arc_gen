import '../../models/Userlist/model.dart';

abstract class UserlistLocalDataSource {
  Future<List<UserlistModel>> getAllItems();
  Future<UserlistModel?> getItemById(String id);
  Future<void> addItem(UserlistModel model);
  Future<void> updateItem(UserlistModel model);
  Future<void> deleteItem(String id);
}

class UserlistLocalDataSourceImpl implements UserlistLocalDataSource {
  @override
  Future<List<UserlistModel>> getAllItems() async {
   throw UnimplementedError();
  }

  @override
  Future<UserlistModel?> getItemById(String id) async {
    // Implementation
  }

  @override
  Future<void> addItem(UserlistModel model) async {
    // Implementation
  }

  @override
  Future<void> updateItem(UserlistModel model) async {
    // Implementation
  }

  @override
  Future<void> deleteItem(String id) async {
    // Implementation
  }
}
