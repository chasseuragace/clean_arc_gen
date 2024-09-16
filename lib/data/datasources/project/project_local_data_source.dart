import '../../models/Project_model.dart';

abstract class ProjectLocalDataSource {
  Future<List<ProjectModel>> getAllItems();
  Future<ProjectModel?> getItemById(String id);
  Future<void> addItem(ProjectModel model);
  Future<void> updateItem(ProjectModel model);
  Future<void> deleteItem(String id);
}

class ProjectLocalDataSourceImpl implements ProjectLocalDataSource {
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
