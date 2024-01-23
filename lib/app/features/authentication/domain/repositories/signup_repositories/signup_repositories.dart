import '../../entities/signup_user_entity.dart';

abstract class SignUpRepositories {
  Future<void> createUser(SignUpUserEntity user);
}
