import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';

enum TextFormFieldStatus { idle, error, success }

enum SignUpStatus { idle, error, success }

@immutable
class SignUpState extends Equatable {
  final String? fullNameSuffix;
  final Color fullNameBorderColor;
  final TextFormFieldStatus fullNameStatus;

  final String? emailSuffix;
  final Color emailBorderColor;
  final TextFormFieldStatus emailStatus;

  final Color passwordBorderColor;
  final bool showPassword;
  final TextFormFieldStatus passwordStatus;

  final Color cPasswordBorderColor;
  final bool cShowPassword;
  final TextFormFieldStatus cPasswordStatus;

  const SignUpState({
    required this.fullNameSuffix,
    required this.fullNameBorderColor,
    required this.fullNameStatus,
    required this.emailSuffix,
    required this.emailBorderColor,
    required this.emailStatus,
    required this.passwordBorderColor,
    required this.showPassword,
    required this.passwordStatus,
    required this.cPasswordBorderColor,
    required this.cShowPassword,
    required this.cPasswordStatus,
  });

  SignUpState copyWith({
    String? fullNameSuffix,
    Color? fullNameBorderColor,
    TextFormFieldStatus? fullNameStatus,
    String? emailSuffix,
    Color? emailBorderColor,
    TextFormFieldStatus? emailStatus,
    Color? passwordBorderColor,
    bool? showPassword,
    TextFormFieldStatus? passwordStatus,
    Color? cPasswordBorderColor,
    bool? cShowPassword,
    TextFormFieldStatus? cPasswordStatus,
  }) {
    return SignUpState(
      fullNameSuffix: fullNameSuffix ?? this.fullNameSuffix,
      fullNameBorderColor: fullNameBorderColor ?? this.fullNameBorderColor,
      fullNameStatus: fullNameStatus ?? this.fullNameStatus,
      emailSuffix: emailSuffix ?? this.emailSuffix,
      emailBorderColor: emailBorderColor ?? this.emailBorderColor,
      emailStatus: emailStatus ?? this.emailStatus,
      passwordBorderColor: passwordBorderColor ?? this.passwordBorderColor,
      showPassword: showPassword ?? this.showPassword,
      passwordStatus: passwordStatus ?? this.passwordStatus,
      cPasswordBorderColor: cPasswordBorderColor ?? this.cPasswordBorderColor,
      cShowPassword: cShowPassword ?? this.cShowPassword,
      cPasswordStatus: cPasswordStatus ?? this.cPasswordStatus,
    );
  }


  factory SignUpState.initial() {
    return SignUpState(
      fullNameSuffix: null,
      fullNameBorderColor: AppColors.primary.withValues(alpha: 0.1),
      fullNameStatus: TextFormFieldStatus.idle,
      emailSuffix: null,
      emailBorderColor: AppColors.primary.withValues(alpha: 0.1),
      emailStatus: TextFormFieldStatus.idle,
      passwordBorderColor: AppColors.primary.withValues(alpha: 0.1),
      showPassword: true,
      passwordStatus: TextFormFieldStatus.idle,
      cPasswordBorderColor: AppColors.primary.withValues(alpha: 0.1),
      cShowPassword: true,
      cPasswordStatus: TextFormFieldStatus.idle,
    );
  }

  @override
  List<Object?> get props => [
    fullNameSuffix,
    fullNameBorderColor,
    fullNameStatus,
    emailSuffix,
    emailBorderColor,
    emailStatus,
    passwordBorderColor,
    showPassword,
    passwordStatus,
    cPasswordBorderColor,
    cShowPassword,
    cPasswordStatus,
  ];
}
