import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flutter_app/src/features/authentication/models/user_model.dart';
import 'package:login_flutter_app/src/repository/user_repository/user_repository.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../screens/forget_password/forget_password_otp/otp_screen.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final  userRepo = Get.put(UserRepository());

  // TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();


  // Call these Functions from Design & they will do the backend
  Future<String?> registerUser(String email, String password) async {
    return await AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
    // As in the AuthenticationRepository we are calling setScreen Method
    // whenever there is change in the user state()
    // therefore when new user is authenticated. AuthenticationRepository detects
    // the change and call setScreen() to switch screens
  }

  // Get phoneNo from user and pass it to Auth Repository for Firebase Authentication
  Future<void> createUser(UserModel user) async {

    await userRepo.createUser(user);
    await registerUser(user.email, user.password);

  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
