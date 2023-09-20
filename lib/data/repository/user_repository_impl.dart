import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okina_practice/data/repository/user_repository.dart';

final userRepositoryProvider = Provider((ref) => UserRepositoryImpl());

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl();
}