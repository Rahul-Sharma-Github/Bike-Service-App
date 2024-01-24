import '../../entities/signin_user_entity.dart';

abstract class SignInRepositories {
  Future<void> signinUser(SignInUserEntity user);
}
