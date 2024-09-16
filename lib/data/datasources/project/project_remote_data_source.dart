import '../../models/Project_model.dart';

abstract class ProjectRemoteDataSource {
  Future<List<ProjectModel>> getAllItems();
  Future<ProjectModel?> getItemById(String id);
  Future<void> addItem(ProjectModel model);
  Future<void> updateItem(ProjectModel model);
  Future<void> deleteItem(String id);
}

class ProjectRemoteDataSourceImpl implements ProjectRemoteDataSource {
  @override
  Future<List<ProjectModel>> getAllItems() async {
   throw UnimplementedError();
  }

  @override
  Future<ProjectModel?> getItemById(String id) async {
    return null;
  
    // Implementation
  }

  @override
  Future<void> addItem(ProjectModel model) async {
    // Implementation
  }

  @override
  Future<void> updateItem(ProjectModel model) async {
    // Implementation
  }

  @override
  Future<void> deleteItem(String id) async {
    // Implementation
  }
}
