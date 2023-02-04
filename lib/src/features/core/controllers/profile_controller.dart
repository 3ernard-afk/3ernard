import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_flutter_app/src/features/authentication/models/user_model.dart';
import 'package:login_flutter_app/src/repository/authentication_repository/authentication_repository.dart';
import 'package:login_flutter_app/src/repository/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  /// Repositories
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  /// Get User Email and pass to UserRepository to fetch user record.
  getUserData() {
    final currentUserEmail = _authRepo.getUserEmail;
    if (currentUserEmail != null) {
      return _userRepo.getUserDetails(currentUserEmail);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  /// Fetch List of user records.
  Future<List<UserModel>> getAllUsers() async => await _userRepo.allUsers();

  /// Update User Data
  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
    //Show some message or redirect to other screen here...
  }

  Future<void> deleteUser() async {
    final uID = _authRepo.getUserID;
    if (uID == null) {
      Get.snackbar("Error", "User cannot be deleted.");
    } else {
      await _userRepo.deleteUser(uID);
      Get.snackbar("Success", "Account has been deleted.");
      // You can call your redirection to other screen here...
      // OR call the LOGOUT() function.
    }
  }
}
