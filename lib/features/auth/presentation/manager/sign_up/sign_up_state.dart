import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';

enum TextFormFieldStatus { idle, error, success }

enum SignUpStatus { idle, error, success }

@immutable
class SignUpState extends Equatable {
  final String? fullNamePrefix;
  final Color fullNameBorderColor;
  final TextFormFieldStatus fullNameStatus;

  final String? emailPrefix;
  final Color emailBorderColor;
  final TextFormFieldStatus emailStatus;

  final String? passwordPrefix;
  final Color passwordBorderColor;
  final bool showPassword;
  final TextFormFieldStatus passwordStatus;

  const SignUpState({
    required this.fullNamePrefix,
    required this.fullNameBorderColor,
    required this.fullNameStatus,
    required this.emailPrefix,
    required this.emailBorderColor,
    required this.emailStatus,
    required this.passwordPrefix,
    required this.passwordBorderColor,
    required this.showPassword,
    required this.passwordStatus,
  });

  SignUpState copyWith({
    String? fullNamePrefix,
    Color? fullNameBorderColor,
    TextFormFieldStatus? fullNameStatus,
    String? emailPrefix,
    Color? emailBorderColor,
    TextFormFieldStatus? emailStatus,
    String? passwordPrefix,
    Color? passwordBorderColor,
    bool? showPassword,
    TextFormFieldStatus? passwordStatus,
  }) {
    return SignUpState(
      fullNamePrefix: fullNamePrefix ?? this.fullNamePrefix,
      fullNameBorderColor: fullNameBorderColor ?? this.fullNameBorderColor,
      fullNameStatus: fullNameStatus ?? this.fullNameStatus,
      emailPrefix: emailPrefix ?? this.emailPrefix,
      emailBorderColor: emailBorderColor ?? this.emailBorderColor,
      emailStatus: emailStatus ?? this.emailStatus,
      passwordPrefix: passwordPrefix ?? this.passwordPrefix,
      passwordBorderColor: passwordBorderColor ?? this.passwordBorderColor,
      showPassword: showPassword ?? this.showPassword,
      passwordStatus: passwordStatus ?? this.passwordStatus,
    );
  }

  factory SignUpState.initial() {
    return SignUpState(
      fullNamePrefix: null,
      fullNameBorderColor: AppColors.primary.withValues(alpha: 0.1),
      fullNameStatus: TextFormFieldStatus.idle,
      emailPrefix: null,
      emailBorderColor: AppColors.primary.withValues(alpha: 0.1),
      emailStatus: TextFormFieldStatus.idle,
      passwordPrefix: "show_password",
      passwordBorderColor: AppColors.primary.withValues(alpha: 0.1),
      showPassword: true,
      passwordStatus: TextFormFieldStatus.idle,
    );
  }

  @override
  List<Object?> get props => [
    fullNamePrefix,
    fullNameBorderColor,
    fullNameStatus,
    emailPrefix,
    emailBorderColor,
    emailStatus,
    passwordPrefix,
    passwordBorderColor,
    showPassword,
    passwordStatus,
  ];
}
