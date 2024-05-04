import 'dart:async';
import 'package:cld_frstr/Tuts/UI/auth/login_screen.dart';
import 'package:cld_frstr/Tuts/UI/firestore/firestore_list_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashSerivces {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if (user != null) {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const FirestoreScreen())));
    } else {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen())));
    }
  }
}
