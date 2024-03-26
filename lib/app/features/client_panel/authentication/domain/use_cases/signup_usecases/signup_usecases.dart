import '../../entities/signup_user_entity.dart';
import '../../repositories/signup_repositories/signup_repositories.dart';

class CreateUserUseCase {
  final SignUpRepositories signUpRepositories;

  CreateUserUseCase(this.signUpRepositories);

  Future<void> call(SignUpUserEntity user) async {
    return await signUpRepositories.createUser(user);
  }
}
