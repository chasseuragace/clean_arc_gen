import 'package:dartz/dartz.dart';
import '../../entities/Userlist/entity.dart';
import '../../repositories/Userlist/repository.dart';
import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';

class UpdateUserlistUseCase implements UseCase<Unit, UserlistEntity> {
  final UserlistRepository repository;

  UpdateUserlistUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(UserlistEntity entity) async {
    return  repository.updateItem(entity);
  }
}
