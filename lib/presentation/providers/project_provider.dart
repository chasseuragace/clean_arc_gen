import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';
import '../../domain/entities/Project_entity.dart';
import '../../domain/usecases/get_all_project.dart';
import '../../domain/usecases/get_project_by_id.dart';
import '../../domain/usecases/add_project.dart';
import '../../domain/usecases/update_project.dart';
import '../../domain/usecases/delete_project.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectNotifier extends StateNotifier<AsyncValue<List<ProjectEntity>>> {
  final GetAllProject _getAllProject;
  final GetProjectById _getProjectById;
  final AddProject _addProject;
  final UpdateProject _updateProject;
  final DeleteProject _deleteProject;

  ProjectNotifier(
    this._getAllProject,
    this._getProjectById,
    this._addProject,
    this._updateProject,
    this._deleteProject,
  ) : super(const AsyncValue.loading());

  Future<void> loadItems() async {
    state = const AsyncValue.loading();
    final result = await _getAllProject(NoParm());
    state = result.fold(
      (failure) =>
          AsyncValue.error(_mapFailureToMessage(failure), StackTrace.current),
      (items) => AsyncValue.data(items),
    );
  }

  Future<void> loadItemById(String id) async {
    final result = await _getProjectById(id);
    state = result.fold(
      (failure) =>
          AsyncValue.error(_mapFailureToMessage(failure), StackTrace.current),
      (item) =>
          AsyncValue.data(item != null ? [item] : []), // Assuming single item
    );
  }

  Future<void> addItem(ProjectEntity item) async {
    final result = await _addProject(item);
    state = result.fold(
      (failure) =>
          AsyncValue.error(_mapFailureToMessage(failure), StackTrace.current),
      (_) => state,
    );
  }

  Future<void> updateItem(ProjectEntity item) async {
    final result = await _updateProject(item);
    state = result.fold(
      (failure) =>
          AsyncValue.error(_mapFailureToMessage(failure), StackTrace.current),
      (_) => state,
    );
  }

  Future<void> deleteItem(String id) async {
    final result = await _deleteProject(id);
    state = result.fold(
      (failure) =>
          AsyncValue.error(_mapFailureToMessage(failure), StackTrace.current),
      (_) => state,
    );
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return 'Server failure';
    } else if (failure is CacheFailure) {
      return 'Cache failure';
    } else {
      return 'Unexpected error';
    }
  }
}

// final ProjectNotifierProvider =
//     StateNotifierProvider<ProjectNotifier, AsyncValue<List<ProjectEntity>>>(
//         (ref) {
//   final getAllProject = ref.watch(getAllProjectProvider);
//   final getProjectById = ref.watch(getProjectByIdProvider);
//   final addProject = ref.watch(addProjectProvider);
//   final updateProject = ref.watch(updateProjectProvider);
//   final deleteProject = ref.watch(deleteProjectProvider);

//   return ProjectNotifier(
//       getAllProject, getProjectById, addProject, updateProject, deleteProject);
// });

// final getAllProjectProvider = Provider<GetAllProject>((ref) {
//   return GetAllProject(ref.watch(ProjectRepositoryProvider));
// });

// final getProjectByIdProvider = Provider<GetProjectById>((ref) {
//   return GetProjectById(ref.watch(ProjectRepositoryProvider));
// });

// final addProjectProvider = Provider<AddProject>((ref) {
//   return AddProject(ref.watch(ProjectRepositoryProvider));
// });

// final updateProjectProvider = Provider<UpdateProject>((ref) {
//   return UpdateProject(ref.watch(ProjectRepositoryProvider));
// });

// final deleteProjectProvider = Provider<DeleteProject>((ref) {
//   return DeleteProject(ref.watch(ProjectRepositoryProvider));
// });
