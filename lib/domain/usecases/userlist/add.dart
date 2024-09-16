import 'package:dartz/dartz.dart';
import '../../entities/Userlist/entity.dart';
import '../../repositories/Userlist/repository.dart';
import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';

class AddUserlistUseCase implements UseCase<Unit, UserlistEntity> {
  final UserlistRepository repository;

  AddUserlistUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(UserlistEntity entity) async {
    return  repository.addItem(entity);
  }
}
