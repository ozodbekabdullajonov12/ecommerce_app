part of 'sign_up_bloc.dart';

abstract class SignUpEvents {}

class CreateAnAccount extends SignUpEvents {}

class ShowPassword extends SignUpEvents {}

final class FullNameValidationFailed extends SignUpEvents {}

final class FullNameValidationSuccess extends SignUpEvents {}

final class EmailValidationFailed extends SignUpEvents {}

final class EmailValidationSuccess extends SignUpEvents {}

final class PasswordValidationFailed extends SignUpEvents {}

final class PasswordValidationSuccess extends SignUpEvents {}
