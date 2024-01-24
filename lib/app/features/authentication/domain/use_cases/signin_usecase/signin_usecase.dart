import '../../entities/signin_user_entity.dart';
import '../../repositories/signin_repositories/signin_repositories.dart';

class SignInUserUseCase {
  final SignInRepositories signInRepositories;

  SignInUserUseCase(this.signInRepositories);

  Future<void> call(SignInUserEntity user) async {
    return await signInRepositories.signinUser(user);
  }
}
