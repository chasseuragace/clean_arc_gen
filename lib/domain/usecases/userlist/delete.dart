import 'package:dartz/dartz.dart';
import '../../repositories/Userlist/repository.dart';
import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';

class DeleteUserlistUseCase implements UseCase<Unit, String> {
  final UserlistRepository repository;

  DeleteUserlistUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(String id) async {
    return  repository.deleteItem(id);
  }
}
