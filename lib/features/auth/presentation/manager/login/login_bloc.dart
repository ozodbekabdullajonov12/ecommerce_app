import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/data/repositories/auth_repository.dart';
import 'package:store/features/auth/presentation/manager/login/login_state.dart';

import '../../../../../main.dart';
import '../auth_validators.dart';
import '../sign_up/sign_up_state.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _repo;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginBloc({required AuthRepository repo})
      : _repo = repo,
        super(LoginState.initial()) {
    on<LoginUser>(_login);
    on<ShowPassword>(_showPassword);

    on<EmailValidationFailed>((event, emit) {
      emit(state.copyWith(
        emailStatus: TextFormFieldStatus.error,
        emailSuffix: "validation_error.svg",
      ));
    });

    on<EmailValidationSuccess>((event, emit) {
      emit(state.copyWith(
        emailSuffix: "validation_success.svg",
        emailStatus: TextFormFieldStatus.success,
        emailBorderColor: Colors.green,
      ));
    });

    on<PasswordValidationFailed>((event, emit) {
      emit(state.copyWith(
        passwordStatus: TextFormFieldStatus.error,
        passwordBorderColor: AppColors.error,
      ));
    });

    on<PasswordValidationSuccess>((event, emit) {
      emit(state.copyWith(
        passwordStatus: TextFormFieldStatus.success,
        passwordBorderColor: Colors.green,
      ));
    });
  }

  Future _login(LoginUser event, Emitter emit) async {
    if (formKey.currentState!.validate()) {
      bool result =await _repo.login(login:emailController.text , password: passwordController.text);
      if (result) {
        navigatorKey.currentContext!.go(Routes.onboarding);
        emit(state.copyWith(loginStatus: LoginStatus.success));
      } else {
        emit(state.copyWith(
          loginStatus: LoginStatus.error,
          emailStatus: TextFormFieldStatus.error,
          passwordStatus: TextFormFieldStatus.error,
          emailSuffix: "validation_error.svg",
          passwordBorderColor: AppColors.error,
        ));
      }
    }
  }

  String? emailValidator(String? value) {
    final error = AuthValidators.validateEmail(value);
    if (error != null) {
      add(EmailValidationFailed());
    } else {
      add(EmailValidationSuccess());
    }
    return error;
  }

  String? passwordValidator(String? value) {
    final error = AuthValidators.validatePassword(value);
    if (error != null) {
      add(PasswordValidationFailed());
    } else {
      add(PasswordValidationSuccess());
    }
    return error;
  }

  Future _showPassword(ShowPassword event, Emitter emit) async {
    emit(state.copyWith(showPassword: !state.showPassword));
  }
}
