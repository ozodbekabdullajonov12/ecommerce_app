import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:store/data/repositories/auth_repository.dart';
import 'package:store/features/forget_reset_password/presentation/manager/reset_password_state.dart';

part "reset_password_event.dart";

class ResetPasswordBloc extends Bloc<ResetPasswordEvents, ResetPasswordState>{
  final AuthRepository _repoReset;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final cPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ResetPasswordBloc({required AuthRepository repoReset})
  : _repoReset = repoReset,
  super(ResetPasswordState.initial()){
  }
}