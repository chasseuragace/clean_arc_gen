
import '../../base_entity.dart';

abstract class UserlistEntity extends BaseEntity {
  UserlistEntity(
      {
      // TODO : Define params

      required super.rawJson,
      required this.id});
      final String id;
}
