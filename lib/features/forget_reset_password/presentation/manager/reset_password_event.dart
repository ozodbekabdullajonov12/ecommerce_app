part of "reset_password_bloc.dart";
sealed class ResetPasswordEvents{}
final class ShowPassword extends ResetPasswordEvents{}
final class CShowPassword extends ResetPasswordEvents{}
final class SendEmail extends ResetPasswordEvents{}
final class VerifyPassword extends ResetPasswordEvents{}
final class ChangePassword extends ResetPasswordEvents{}
final class EmailValidationFailed extends ResetPasswordEvents{}
final class EmailValidationSuccess extends ResetPasswordEvents{}
final class PasswordValidationFailed extends ResetPasswordEvents {}
final class PasswordValidationSuccess extends ResetPasswordEvents {}
final class CPasswordValidationFailed extends ResetPasswordEvents {}
final class CPasswordValidationSuccess extends ResetPasswordEvents {}
final class ResetPasswordLogin extends ResetPasswordEvents{}
final class ResendCode extends ResetPasswordEvents{}