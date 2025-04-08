part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginUser extends LoginEvent {}

class ShowPassword extends LoginEvent {}

final class EmailValidationFailed extends LoginEvent {}

final class EmailValidationSuccess extends LoginEvent {}

final class PasswordValidationFailed extends LoginEvent {}

final class PasswordValidationSuccess extends LoginEvent {}
