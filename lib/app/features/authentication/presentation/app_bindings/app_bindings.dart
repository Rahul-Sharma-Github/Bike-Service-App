import 'package:bike_service_app/app/features/authentication/data/repositories_implement/signup_repositories_impl/signup_repositories_impl.dart';
import 'package:bike_service_app/app/features/authentication/domain/repositories/signup_repositories/signup_repositories.dart';
import 'package:bike_service_app/app/features/authentication/domain/use_cases/signin_usecase/signin_usecase.dart';
import 'package:bike_service_app/app/features/authentication/domain/use_cases/signup_usecases/signup_usecases.dart';
import 'package:bike_service_app/app/features/authentication/presentation/controllers/signup_page/signup_controller.dart';
import 'package:get/get.dart';

import '../../data/repositories_implement/signin_repositories_impl/signin_repositories_impl.dart';
import '../../domain/repositories/signin_repositories/signin_repositories.dart';
import '../controllers/signin_page/signin_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Bindings for SignUp a User
    Get.lazyPut<SignUpRepositories>(() => SignUpRepositoryImpl());

    Get.lazyPut(() => CreateUserUseCase(Get.find()));

    Get.put(SignUpController(Get.find()));

    // Bindings for SignIn a User
    Get.lazyPut<SignInRepositories>(() => SignInRepositoryImpl());

    Get.lazyPut(() => SignInUserUseCase(Get.find()));

    Get.put(SignInController(Get.find()));
  }
}
