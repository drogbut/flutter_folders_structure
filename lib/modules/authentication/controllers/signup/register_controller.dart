import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utilities/helpers/network_manager.dart';
import '../../../../utilities/popups/full_screen_loader.dart';
import '../../../../utilities/popups/loaders.dart';
import '../../data/repository/auth_repository.dart';
import '../../data/repository/user_repository.dart';
import '../../models/user/user.dart';
import '../../screens/register/widgets/verification_email_screen.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();
  final authRepository = AuthenticationRepository.instance;

  ///================ variables ========================================
  RxBool hidePassword = true.obs;
  RxBool privacyPolicy = true.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  ///====================== Signup =====================================
  Future<void> signup() async {
    try {
      /// Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      /// Check form validation
      if (!registerFormKey.currentState!.validate()) {
        /// Show an error message if the form is invalid
        TLoaders.errorSnackbar(title: 'Error', message: 'Please fill in all required fields');
        return;
      }

      /// Check privacy policy
      if (!privacyPolicy.value) {
        TLoaders.warningSnackbar(
            title: 'Accept privacy policy',
            message: 'In order to create an account, you must accept the privacy policy and terms of conditions.');
        return;
      }

      /// Start loading
      // TFullScreenLoader.openLoadingDialog('We are processing your information...', TImages.animalIcon);

      /// Register user in Firebase Auth & Save user data in Firebase
      final userCredential = await authRepository.registerWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      /// Save user data
      final userModel = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        password: password.text.trim(),
        phoneNumber: phone.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserrecord(user: userModel);

      /// Remove loader
      TFullScreenLoader.stopLoading();

      /// Success message
      TLoaders.successSnackbar(
          title: 'Congratulations', message: 'Your account has been created! Verify email to continue.');

      /// Move to verify email screen
      Get.to(() => VerificationEmailScreen(email: email.text.trim()));
    } catch (e) {
      /// Show generic error
      TLoaders.errorSnackbar(title: 'Register error', message: e.toString());
    }
  }
}