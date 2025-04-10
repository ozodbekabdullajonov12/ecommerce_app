import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:store/core/utils/colors.dart';

import '../../../auth/presentation/manager/sign_up/sign_up_state.dart';

enum ResetPasswordLoading { idle, error, success }

@immutable
class ResetPasswordState extends Equatable {
  final String? emailSuffix;
  final Color emailBorderColor;
  final TextFormFieldStatus emailStatus;
  final Color passwordBorderColor;
  final bool showPassword;
  final TextFormFieldStatus passwordStatus;
  final Color cPasswordBorderColor;
  final bool cShowPassword;
  final TextFormFieldStatus cPasswordStatus;
  final String? code;

  const ResetPasswordState({
    required this.emailSuffix,
    required this.emailBorderColor,
    required this.emailStatus,
    required this.passwordBorderColor,
    required this.showPassword,
    required this.passwordStatus,
    required this.cPasswordBorderColor,
    required this.cShowPassword,
    required this.cPasswordStatus,
    required this.code,
  });

  factory ResetPasswordState.initial() {
    return ResetPasswordState(
      emailSuffix: null,
      emailBorderColor: AppColors.primary100,
      emailStatus: TextFormFieldStatus.idle,
      passwordBorderColor: AppColors.primary100,
      showPassword: true,
      passwordStatus: TextFormFieldStatus.idle,
      cPasswordBorderColor: AppColors.primary100,
      cShowPassword: true,
      cPasswordStatus: TextFormFieldStatus.idle,
      code: null,
    );
  }


  ResetPasswordState copyWith({
    String? emailSuffix,
    Color? emailBorderColor,
    TextFormFieldStatus? emailStatus,
    Color? passwordBorderColor,
    bool? showPassword,
    TextFormFieldStatus? passwordStatus,
    Color? cPasswordBorderColor,
    bool? cShowPassword,
    TextFormFieldStatus? cPasswordStatus,
    String? code,
  }) {
    return ResetPasswordState(
      emailSuffix: emailSuffix ?? this.emailSuffix,
      emailBorderColor: emailBorderColor ?? this.emailBorderColor,
      emailStatus: emailStatus ?? this.emailStatus,
      passwordBorderColor: passwordBorderColor ?? this.passwordBorderColor,
      showPassword: showPassword ?? this.showPassword,
      passwordStatus: passwordStatus ?? this.passwordStatus,
      cPasswordBorderColor: cPasswordBorderColor ?? this.cPasswordBorderColor,
      cShowPassword: cShowPassword ?? this.cShowPassword,
      cPasswordStatus: cPasswordStatus ?? this.cPasswordStatus,
      code: code ?? this.code,
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
    cPasswordBorderColor,
    cShowPassword,
    cPasswordStatus,
    code,
  ];
}
