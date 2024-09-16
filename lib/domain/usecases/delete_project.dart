import 'package:dartz/dartz.dart';
import '../repositories/Project_repository.dart';
import '../../core/errors/failures.dart';
import '../../core/usecases/usecase.dart';

class DeleteProject implements UseCase<Unit, String> {
  final ProjectRepository repository;

  DeleteProject(this.repository);

  @override
  Future<Either<Failure, Unit>> call(String id) async {
    return  repository.deleteItem(id);
  }
}
