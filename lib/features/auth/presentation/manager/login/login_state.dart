import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/colors.dart';
import '../sign_up/sign_up_state.dart';

enum LoginStatus { idle, success, error }

class LoginState extends Equatable {
  final String? emailSuffix;
  final Color emailBorderColor;
  final TextFormFieldStatus emailStatus;

  final Color passwordBorderColor;
  final bool showPassword;
  final TextFormFieldStatus passwordStatus;

  final LoginStatus loginStatus;

  const LoginState({
    required this.emailSuffix,
    required this.emailBorderColor,
    required this.emailStatus,
    required this.passwordBorderColor,
    required this.showPassword,
    required this.passwordStatus,
    required this.loginStatus,
  });

  factory LoginState.initial() {
    return LoginState(
      emailSuffix: null,
      emailBorderColor: AppColors.primary.withValues(alpha: 0.1),
      emailStatus: TextFormFieldStatus.idle,
      passwordBorderColor: AppColors.primary.withValues(alpha: 0.1),
      showPassword: true,
      passwordStatus: TextFormFieldStatus.idle,
      loginStatus: LoginStatus.idle,
    );
  }

  LoginState copyWith({
    String? emailSuffix,
    Color? emailBorderColor,
    TextFormFieldStatus? emailStatus,
    Color? passwordBorderColor,
    bool? showPassword,
    TextFormFieldStatus? passwordStatus,
    LoginStatus? loginStatus,
  }) {
    return LoginState(
      emailSuffix: emailSuffix ?? this.emailSuffix,
      emailBorderColor: emailBorderColor ?? this.emailBorderColor,
      emailStatus: emailStatus ?? this.emailStatus,
      passwordBorderColor: passwordBorderColor ?? this.passwordBorderColor,
      showPassword: showPassword ?? this.showPassword,
      passwordStatus: passwordStatus ?? this.passwordStatus,
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }

  @override
  List<Object?> get props => [
    emailSuffix,
    emailBorderColor,
    emailStatus,
    passwordBorderColor,
    showPassword,
    passwordStatus,
    loginStatus,
  ];
}
