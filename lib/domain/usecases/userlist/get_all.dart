import 'package:dartz/dartz.dart';
import '../../entities/Userlist/entity.dart';
import '../../repositories/Userlist/repository.dart';
import '../../../core/errors/failures.dart';
import '../../../core/usecases/usecase.dart';

class GetAllUserlistUseCase implements UseCase<List<UserlistEntity>, NoParm> {
  final UserlistRepository repository;

  GetAllUserlistUseCase (this.repository);

  @override
  Future<Either<Failure, List<UserlistEntity>>> call(NoParm params) async {
    return  repository.getAllItems();
  }
}
