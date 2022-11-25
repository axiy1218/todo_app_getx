import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AuthDataProvider extends GetxService {
  late final FirebaseAuth _auth;
  AuthDataProvider() {
    _auth = FirebaseAuth.instance;
    log('FIREBASE AUTH INITED');
  }

  Future<UserCredential?> signUp(
      {required String email, required String password}) async {
    try {
      final userCredentional = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      debugPrint('User signed up');
      return userCredentional;
    } on FirebaseException catch (e, s) {
      log(e.toString());
      log(s.toString());
    }
    return null;
  }

  FirebaseAuth get auth => _auth;
}
