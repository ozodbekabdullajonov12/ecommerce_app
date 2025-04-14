import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/data/repositories/auth_repository.dart';
import 'package:store/features/auth/presentation/manager/auth_validators.dart';
import 'package:store/features/auth/presentation/manager/sign_up/sign_up_state.dart';
import 'package:store/features/forget_reset_password/presentation/manager/reset_password_state.dart';
import 'package:store/main.dart';

part "reset_password_event.dart";

class ResetPasswordBloc extends Bloc<ResetPasswordEvents, ResetPasswordState>{
  final AuthRepository _repoReset;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cPasswordController = TextEditingController();

  final GlobalKey<FormState> formKeyEmail = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyPassword = GlobalKey<FormState>();

  ResetPasswordBloc({required AuthRepository repoReset})
  : _repoReset = repoReset,
  super(ResetPasswordState.initial()){
    on<ShowPassword>(_showPassword);
    on<VerifyPassword>(_verifyCode);
    on<SendEmail>(_sendEmail);

    on<EmailValidationFailed>((event, emit){
      emit(state.copyWith(
        emailStatus: TextFormFieldStatus.error,
        emailSuffix: "validation_error.svg"
      ));
    });
    on<EmailValidationSuccess>((event , emit){
      emit(state.copyWith(
        emailSuffix: "validation_success.svg",
        emailStatus: TextFormFieldStatus.success,
        emailBorderColor: Colors.green,
      ));
    });
    on<PasswordValidationFailed>((event, emit){
      emit(state.copyWith(
        passwordStatus: TextFormFieldStatus.error,
        passwordBorderColor: AppColors.error
      ));
    });
    on<PasswordValidationSuccess>((event, emit){
      emit(state.copyWith(
        passwordStatus: TextFormFieldStatus.success,
        passwordBorderColor: Colors.green
      ));
    });
  }
  Future _sendEmail(SendEmail event, Emitter emit)async {
    if (formKeyEmail.currentState!.validate()) {
      await _repoReset.resetPasswordEmail(email: emailController.text);
      navigatorKey.currentContext!.go(Routes.enterCode);
    }
  }
  Future _verifyCode(VerifyPassword event , Emitter emit) async{
    bool result = await _repoReset.resetPasswordVerify(email: emailController.text, code: event.code);
    if (result) {
      emit(state.copyWith(emailStatus: TextFormFieldStatus.success));
      navigatorKey.currentContext!.go(Routes.resetPassword);
    }else{
      emit(state.copyWith(emailStatus: TextFormFieldStatus.error));
    }
  }
  Future _showPassword(ShowPassword event, Emitter emit)async{
    emit(state.copyWith(showPassword: !state.showPassword));
  }
  String? emailValidator(String? value){
    final error = AuthValidators.validateEmail(value);
    if (error != null) {
      add(EmailValidationFailed());
    }else{
      add(EmailValidationSuccess());
    }
    return error;
  }
  String? passwordValidator(String? value){
    final error = AuthValidators.validatePassword(value);
    if (error != null){
      add(PasswordValidationFailed());
    } else{
      add(PasswordValidationSuccess());
    }
    return error;
  }

  String? cPasswordValidator(String? value) {
    final error = AuthValidators.validateConfirmPassword(passwordController.text, value);
    if (error != null) {
      add(CPasswordValidationFailed());
    } else {
      add(CPasswordValidationSuccess());
    }
    return error;
  }
}