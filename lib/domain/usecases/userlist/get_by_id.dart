import 'package:dartz/dartz.dart';
import '../../entities/Userlist/entity.dart';
import '../../repositories/Userlist/repository.dart';
import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';

class GetUserlistByIdUseCase implements UseCase<UserlistEntity?, String> {
  final UserlistRepository repository;

  GetUserlistByIdUseCase(this.repository);

  @override
  Future<Either<Failure, UserlistEntity?>> call(String id) async {
    return  repository.getItemById(id);
  }
}
