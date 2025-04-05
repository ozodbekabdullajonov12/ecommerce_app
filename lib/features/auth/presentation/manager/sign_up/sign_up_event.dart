part of 'sign_up_bloc.dart';

abstract class SignUpEvents {}

class CreateAnAccount extends SignUpEvents {}

class ShowPassword extends SignUpEvents {}

class FullNameChanged extends SignUpEvents {
  final String? value;
  FullNameChanged(this.value);
}

class EmailChanged extends SignUpEvents {
  final String? value;
  EmailChanged(this.value);
}

class PasswordChanged extends SignUpEvents {
  final String? value;
  PasswordChanged(this.value);
}
