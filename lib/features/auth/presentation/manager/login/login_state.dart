import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/utils/colors.dart';
import '../sign_up/sign_up_state.dart';
part 'login_state.freezed.dart';

enum LoginStatus { idle, success, error }
@freezed
abstract class LoginState with  _$LoginState {


 const factory LoginState({
    required String? emailSuffix,
    required Color emailBorderColor,
    required TextFormFieldStatus emailStatus,
    required Color passwordBorderColor,
    required bool showPassword,
    required TextFormFieldStatus passwordStatus,
    required  LoginStatus loginStatus,
  }) = _LoginState;

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




}
