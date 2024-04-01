import 'package:equatable/equatable.dart';

abstract class RegisterState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class RegisterInitial extends RegisterState {}

class NavigateToLoginState extends RegisterState {}
