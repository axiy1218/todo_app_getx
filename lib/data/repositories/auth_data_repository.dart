import 'dart:developer';

import 'package:get/get.dart';
import 'package:todo_app_getx/data/dataprovider/auth_data_provider.dart';

import '../models/user_model.dart';

class AuthDataRepository extends GetxService {
  late final AuthDataProvider authDataProvider;
  AuthDataRepository() {
    try {
      authDataProvider = Get.find<AuthDataProvider>();
      log('AUTH REPO INITED');
    } catch (e) {
      log(e.toString());
    }
  }

  Future<User?> signUpRepo(
      {required String email,
      required String username,
      required String password}) async {
    try {
      final userCredentional =
          await authDataProvider.signUp(email: email, password: password);
      return User(
          uid: userCredentional!.user!.uid,
          email: email,
          password: password,
          userCreatedDate: DateTime.now(),
          username: username);
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
    return null;
  }
}
