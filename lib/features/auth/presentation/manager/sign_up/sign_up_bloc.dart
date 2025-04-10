import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/data/repositories/auth_repository.dart';
import 'package:store/features/auth/presentation/manager/sign_up/sign_up_state.dart';

import '../../../../../main.dart';
import '../auth_validators.dart';


part 'sign_up_event.dart';

class SignUpBloc extends Bloc<SignUpEvents, SignUpState> {
  final AuthRepository _repo;

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cPasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignUpBloc({required AuthRepository repo})
      : _repo = repo,
        super(SignUpState.initial()) {
    on<CreateAnAccount>(_createAccount);
    on<ShowPassword>(_showPassword);
    on<CShowPassword>(_cShowPassword);

    on<FullNameValidationFailed>((event, emit) {
      emit(state.copyWith(
        fullNameStatus: TextFormFieldStatus.error,
        fullNameSuffix: "validation_error.svg",
      ));
    });

    on<FullNameValidationSuccess>((event, emit) {
      emit(state.copyWith(
        fullNameStatus: TextFormFieldStatus.success,
        fullNameSuffix: "validation_success.svg",
        fullNameBorderColor: Colors.green,
      ));
    });

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

    on<CPasswordValidationFailed>((event, emit) {
      emit(state.copyWith(
        cPasswordStatus: TextFormFieldStatus.error,
        cPasswordBorderColor: AppColors.error,
      ));
    });

    on<CPasswordValidationSuccess>((event, emit) {
      emit(state.copyWith(
        cPasswordStatus: TextFormFieldStatus.success,
        cPasswordBorderColor: Colors.green,
      ));
    });
  }

  Future _createAccount(CreateAnAccount event, Emitter emit) async {
    if (formKey.currentState!.validate()) {
      bool result = await _repo.signUp(
        fullName: fullNameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      print("$result");
      if (result) {
        navigatorKey.currentContext!.go(Routes.onboarding);
      } else {
        emit(state.copyWith(
          fullNameStatus: TextFormFieldStatus.error,
          fullNameSuffix: "validation_error.svg",
          emailStatus: TextFormFieldStatus.error,
          emailSuffix: "validation_error.svg",
          passwordStatus: TextFormFieldStatus.error,
          passwordBorderColor: AppColors.error,
          cPasswordStatus: TextFormFieldStatus.error,
          cPasswordBorderColor: AppColors.error,
        ));
      }
    } else {
      emit(state.copyWith());
    }
  }

  String? fullNameValidator(String? value) {
    final error=AuthValidators.validateFullName(value);
    if(error!=null){
      add(FullNameValidationFailed());
    }else{
      add(FullNameValidationSuccess());
    }
    return error;
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

  String? cPasswordValidator(String? value) {
    final error = AuthValidators.validateConfirmPassword(passwordController.text, value);
    if (error != null) {
      add(CPasswordValidationFailed());
    } else {
      add(CPasswordValidationSuccess());
    }
    return error;
  }

  Future _showPassword(ShowPassword event, Emitter emit) async {
    emit(state.copyWith(showPassword: !state.showPassword));
  }

  Future _cShowPassword(CShowPassword event, Emitter emit) async {
    emit(state.copyWith(cShowPassword: !state.cShowPassword));
  }
}
