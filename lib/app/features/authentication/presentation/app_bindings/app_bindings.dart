import 'package:bike_service_app/app/features/authentication/data/repositories_implement/signup_repositories_impl/signup_repositories_impl.dart';
import 'package:bike_service_app/app/features/authentication/domain/repositories/signup_repositories/signup_repositories.dart';
import 'package:bike_service_app/app/features/authentication/domain/use_cases/signup_usecases/signup_usecases.dart';
import 'package:bike_service_app/app/features/authentication/presentation/controllers/signup_page/signup_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpRepositories>(() => SignUpRepositoryImpl());

    Get.lazyPut(() => CreateUserUseCase(Get.find()));

    Get.put(SignUpController(Get.find()));
  }
}
