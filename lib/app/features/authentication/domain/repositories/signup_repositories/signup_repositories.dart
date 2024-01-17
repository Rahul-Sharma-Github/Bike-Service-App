import '../../models/signup_model/signup_model.dart';

abstract class SignUpRepositories {
  Future<void> createUser(User user);
}
