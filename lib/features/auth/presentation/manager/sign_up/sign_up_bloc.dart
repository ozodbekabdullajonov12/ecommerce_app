import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/core/utils/colors.dart';
import 'package:store/data/repositories/auth_repository.dart';
import 'package:store/features/auth/presentation/manager/sign_up/sign_up_state.dart';
import 'package:store/main.dart';

part 'sign_up_event.dart';

class SignUpBloc extends Bloc<SignUpEvents, SignUpState> {
  final AuthRepository _repo;

  final fullNameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignUpBloc({required AuthRepository repo})
    : _repo = repo,
      super(SignUpState.initial()) {
    on<CreateAnAccount>(_createAccount);
    on<ShowPassword>(_showPassword);
  }

  Future _createAccount(CreateAnAccount event, Emitter emit) async {
    emit(
      state.copyWith(
        fullNameStatus: TextFormFieldStatus.idle,
        emailStatus: TextFormFieldStatus.idle,
        passwordStatus: TextFormFieldStatus.idle,
      ),
    );
    if (formKey.currentState!.validate()) {
      bool result = await _repo.signUp(
        fullName: fullNameController.text,
        email: emailController.text,
        password: passwordController.text,
      );
      if (result) {
        navigatorKey.currentContext!.go(Routes.onboarding);
      } else {
        emit(
          state.copyWith(
            fullNameStatus: TextFormFieldStatus.error,
            fullNamePrefix: "validation_error",
            emailStatus: TextFormFieldStatus.error,
            emailPrefix: "validation_error",
            passwordStatus: TextFormFieldStatus.error,
            passwordPrefix: "validation_error",
          ),
        );
      }
    }
  }

  String? fullNameValidator(String? value, Emitter emit) {
    if (value == null) {
      emit(
        state.copyWith(
          fullNameStatus: TextFormFieldStatus.error,
          fullNamePrefix: "validation_error",
        ),
      );
      return "Enter full name,please";
    } else {
      emit(
        state.copyWith(
          fullNamePrefix: "validation_success",
          fullNameStatus: TextFormFieldStatus.success,
          fullNameBorderColor: Colors.green,
        ),
      );
      return null;
    }
  }

  String? emailValidator(String? value, Emitter emit) {
    if (state.fullNameStatus == TextFormFieldStatus.success) {
      if (value == null) {
        emit(
          state.copyWith(
            emailStatus: TextFormFieldStatus.error,
            emailPrefix: "validation_error",
          ),
        );
        return "Enter email,please";
      } else {
        emit(
          state.copyWith(
            emailPrefix: "validation_success",
            emailStatus: TextFormFieldStatus.success,
            emailBorderColor: Colors.green,
          ),
        );
        return null;
      }
    } else {
      return null;
    }
  }

  String? passwordValidator(String? value, Emitter emit) {
    if (state.fullNameStatus == TextFormFieldStatus.success &&
        state.emailStatus == TextFormFieldStatus.success) {
      if (value == null) {
        emit(
          state.copyWith(
            passwordStatus: TextFormFieldStatus.error,
            passwordPrefix: "validation_error",
          ),
        );
        return "Enter password,please";
      } else {
        emit(
          state.copyWith(
            passwordPrefix: "validation_success",
            passwordStatus: TextFormFieldStatus.success,
            passwordBorderColor: Colors.green,
          ),
        );
        return null;
      }
    } else {
      return null;
    }
  }

  Future _showPassword(ShowPassword event, Emitter emit) async {
    emit(state.copyWith(showPassword: !state.showPassword));
  }
}
