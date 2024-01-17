import '../../models/signup_model/signup_model.dart';
import '../../repositories/signup_repositories/signup_repositories.dart';

class CreateUserUseCase {
  final SignUpRepositories signUpRepositories;

  CreateUserUseCase(this.signUpRepositories);

  Future<void> execute(User user) async {
    return await signUpRepositories.createUser(user);
  }
}
