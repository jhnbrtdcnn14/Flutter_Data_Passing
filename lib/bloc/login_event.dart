import 'package:flutter/material.dart';

abstract class LoginEvent {}

// typedef NavigationCallback = void Function(); // Defined here

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;
  final BuildContext context;

  LoginButtonPressed(
      {required this.username,
      required this.password,
      required this.context // Pass the context here
      });
}

class LoginNavigateToRegister extends LoginEvent {}
