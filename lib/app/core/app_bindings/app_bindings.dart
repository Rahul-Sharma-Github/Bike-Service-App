import 'package:bike_service_app/app/features/authentication/data/repositories_implement/signup_repositories_impl/signup_repositories_impl.dart';
import 'package:bike_service_app/app/features/authentication/domain/repositories/signup_repositories/signup_repositories.dart';
import 'package:bike_service_app/app/features/authentication/domain/use_cases/signin_usecase/signin_usecase.dart';
import 'package:bike_service_app/app/features/authentication/domain/use_cases/signup_usecases/signup_usecases.dart';
import 'package:bike_service_app/app/features/authentication/presentation/controllers/signup_page/signup_controller.dart';
import 'package:bike_service_app/app/features/services/data/repositories_implement/service_page_repo_impl/service_page_repo_impl.dart';
import 'package:bike_service_app/app/features/services/domain/repositories/service_page_repositories/service_page_repository.dart';
import 'package:bike_service_app/app/features/services/domain/use_cases/service_page_usecase/service_page_usecase.dart';
import 'package:bike_service_app/app/features/services/presentation/controllers/service_page_controller/service_page_controller.dart';
import 'package:get/get.dart';

import '../../features/authentication/data/repositories_implement/signin_repositories_impl/signin_repositories_impl.dart';
import '../../features/authentication/domain/repositories/signin_repositories/signin_repositories.dart';
import '../../features/authentication/presentation/controllers/signin_page/signin_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    /// authentication feature Bindings
    // Bindings for SignUp a User
    Get.lazyPut<SignUpRepositories>(() => SignUpRepositoryImpl());

    Get.lazyPut(() => CreateUserUseCase(Get.find()));

    Get.put(SignUpController(Get.find()));

    // Bindings for SignIn a User
    Get.lazyPut<SignInRepositories>(() => SignInRepositoryImpl());

    Get.lazyPut(() => SignInUserUseCase(Get.find()));

    Get.put(SignInController(Get.find()));

    /// my_services feature bindings
    //
    Get.lazyPut<ServicePageRepository>(() => ServicePageRepoImpl());

    Get.lazyPut(() => ServicePageUseCase(Get.find()));

    Get.put(ServicePageController(Get.find()));
  }
}
