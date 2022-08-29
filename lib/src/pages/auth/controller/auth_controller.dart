import 'package:get/get.dart';

class AuthController extends GetxController {

  RxBool isLoading = false.obs;

  Future<void> signIn({required String email, required String password}) async {
    isLoading.value = true;

    // Requisição no Back
    await Future.delayed(const Duration(seconds: 3));

    isLoading.value = false;
  }

}