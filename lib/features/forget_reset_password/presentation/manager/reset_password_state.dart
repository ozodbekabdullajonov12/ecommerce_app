import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store/core/utils/colors.dart';

import '../../../auth/presentation/manager/sign_up/sign_up_state.dart';
part 'reset_password_state.freezed.dart';

enum ResetPasswordStatus { idle, error, success }

@freezed
abstract class ResetPasswordState with _$ResetPasswordState{

  const factory ResetPasswordState({
    required String? emailSuffix,
    required Color emailBorderColor,
    required TextFormFieldStatus emailStatus,
    required Color passwordBorderColor,
    required bool showPassword,
    required TextFormFieldStatus passwordStatus,
    required Color cPasswordBorderColor,
    required bool cShowPassword,
    required TextFormFieldStatus cPasswordStatus,
    required String? code,
    required ResetPasswordStatus status
  }) = _ResetPasswordState;

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
      status: ResetPasswordStatus.idle
    );
  }



}
