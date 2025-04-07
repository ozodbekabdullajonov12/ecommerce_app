import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/data/repositories/auth_repository.dart';
import 'package:store/features/auth/presentation/manager/sign_up/sign_up_state.dart';
import 'package:store/main.dart';

part 'sign_up_event.dart';

class SignUpBloc extends Bloc<SignUpEvents, SignUpState> {
  final AuthRepository _repo;

  final fullNameController = TextEditingController();

  final  emailController = TextEditingController();

  final passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  SignUpBloc({required AuthRepository repo})
    : _repo = repo, super(SignUpState.initial()) {
    on<CreateAnAccount>(_createAccount);
    on<ShowPassword>(_showPassword);
    on<FullNameValidationFailed>((event, emit) {
      emit(
        state.copyWith(
          fullNameStatus: TextFormFieldStatus.error,
          fullNamePrefix: "validation_error.svg",
        ),
      );
    });
    on<FullNameValidationSuccess>((event, emit) {
      emit(
        state.copyWith(
          fullNameStatus: TextFormFieldStatus.success,
          fullNamePrefix: "validation_success.svg",
          fullNameBorderColor: Colors.green,
        ),
      );
    });
    on<EmailValidationFailed>((event, emit) {
      emit(
        state.copyWith(
          emailStatus: TextFormFieldStatus.error,
          emailPrefix: "validation_error.svg",
        ),
      );
    });
    on<EmailValidationSuccess>((event, emit) {
      emit(
        state.copyWith(
          emailPrefix: "validation_success.svg",
          emailStatus: TextFormFieldStatus.success,
          emailBorderColor: Colors.green,
        ),
      );
    });
    on<PasswordValidationFailed>((event, emit) {
      emit(
        state.copyWith(
          passwordStatus: TextFormFieldStatus.error,
          passwordPrefix: "validation_error.svg",
        ),
      );
    });
    on<PasswordValidationSuccess>((event, emit) {
      emit(
        state.copyWith(
          passwordPrefix: "validation_success.svg",
          passwordStatus: TextFormFieldStatus.success,
          passwordBorderColor: Colors.green,
        ),
      );
    });
  }
  Future _createAccount(CreateAnAccount event, Emitter emit) async {
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
            fullNamePrefix: "validation_error.svg",
            emailStatus: TextFormFieldStatus.error,
            emailPrefix: "validation_error.svg",
            passwordStatus: TextFormFieldStatus.error,
            passwordPrefix: "validation_error.svg",
          ),
        );
      }
    }
    else{
      emit(state.copyWith());
    }
  }

  String? fullNameValidator(String? value) {
    if (value == null) {
      add(FullNameValidationFailed());
      return "Enter full name,please";
    } else {
   add(FullNameValidationSuccess());
      return null;
    }
  }

  String? emailValidator(String? value) {
    if (state.fullNameStatus == TextFormFieldStatus.success) {
      if (value == null) {
        add(EmailValidationFailed());
        return "Enter email,please";
      } else {
       add(EmailValidationSuccess());
        return null;
      }
    } else {
      return null;
    }
  }

  String? passwordValidator(String? value) {
    if (state.fullNameStatus == TextFormFieldStatus.success &&
        state.emailStatus == TextFormFieldStatus.success) {
      if (value == null) {
       add(PasswordValidationFailed());
        return "Enter password,please";
      } else {
        add(PasswordValidationSuccess());
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
