import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/utils/colors.dart';
part 'sign_up_state.freezed.dart';

enum TextFormFieldStatus { idle, error, success }

enum SignUpStatus { idle, error, success}

@freezed
abstract class SignUpState with _$SignUpState{

  const factory SignUpState({
    required String? fullNameSuffix,
    required Color fullNameBorderColor,
    required TextFormFieldStatus fullNameStatus,
    required String? emailSuffix,
    required Color emailBorderColor,
    required TextFormFieldStatus emailStatus,
    required Color passwordBorderColor,
    required bool showPassword,
    required TextFormFieldStatus passwordStatus,
    required Color cPasswordBorderColor,
    required bool cShowPassword,
    required TextFormFieldStatus cPasswordStatus,
  }) = _SignUpState;




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

}
