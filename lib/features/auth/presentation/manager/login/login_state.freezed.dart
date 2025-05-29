// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginState {
  String? get emailSuffix;
  Color get emailBorderColor;
  TextFormFieldStatus get emailStatus;
  Color get passwordBorderColor;
  bool get showPassword;
  TextFormFieldStatus get passwordStatus;
  LoginStatus get loginStatus;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginStateCopyWith<LoginState> get copyWith =>
      _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginState &&
            (identical(other.emailSuffix, emailSuffix) ||
                other.emailSuffix == emailSuffix) &&
            (identical(other.emailBorderColor, emailBorderColor) ||
                other.emailBorderColor == emailBorderColor) &&
            (identical(other.emailStatus, emailStatus) ||
                other.emailStatus == emailStatus) &&
            (identical(other.passwordBorderColor, passwordBorderColor) ||
                other.passwordBorderColor == passwordBorderColor) &&
            (identical(other.showPassword, showPassword) ||
                other.showPassword == showPassword) &&
            (identical(other.passwordStatus, passwordStatus) ||
                other.passwordStatus == passwordStatus) &&
            (identical(other.loginStatus, loginStatus) ||
                other.loginStatus == loginStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      emailSuffix,
      emailBorderColor,
      emailStatus,
      passwordBorderColor,
      showPassword,
      passwordStatus,
      loginStatus);

  @override
  String toString() {
    return 'LoginState(emailSuffix: $emailSuffix, emailBorderColor: $emailBorderColor, emailStatus: $emailStatus, passwordBorderColor: $passwordBorderColor, showPassword: $showPassword, passwordStatus: $passwordStatus, loginStatus: $loginStatus)';
  }
}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) _then) =
      _$LoginStateCopyWithImpl;
  @useResult
  $Res call(
      {String? emailSuffix,
      Color emailBorderColor,
      TextFormFieldStatus emailStatus,
      Color passwordBorderColor,
      bool showPassword,
      TextFormFieldStatus passwordStatus,
      LoginStatus loginStatus});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailSuffix = freezed,
    Object? emailBorderColor = null,
    Object? emailStatus = null,
    Object? passwordBorderColor = null,
    Object? showPassword = null,
    Object? passwordStatus = null,
    Object? loginStatus = null,
  }) {
    return _then(_self.copyWith(
      emailSuffix: freezed == emailSuffix
          ? _self.emailSuffix
          : emailSuffix // ignore: cast_nullable_to_non_nullable
              as String?,
      emailBorderColor: null == emailBorderColor
          ? _self.emailBorderColor
          : emailBorderColor // ignore: cast_nullable_to_non_nullable
              as Color,
      emailStatus: null == emailStatus
          ? _self.emailStatus
          : emailStatus // ignore: cast_nullable_to_non_nullable
              as TextFormFieldStatus,
      passwordBorderColor: null == passwordBorderColor
          ? _self.passwordBorderColor
          : passwordBorderColor // ignore: cast_nullable_to_non_nullable
              as Color,
      showPassword: null == showPassword
          ? _self.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordStatus: null == passwordStatus
          ? _self.passwordStatus
          : passwordStatus // ignore: cast_nullable_to_non_nullable
              as TextFormFieldStatus,
      loginStatus: null == loginStatus
          ? _self.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as LoginStatus,
    ));
  }
}

/// @nodoc

class _LoginState implements LoginState {
  const _LoginState(
      {required this.emailSuffix,
      required this.emailBorderColor,
      required this.emailStatus,
      required this.passwordBorderColor,
      required this.showPassword,
      required this.passwordStatus,
      required this.loginStatus});

  @override
  final String? emailSuffix;
  @override
  final Color emailBorderColor;
  @override
  final TextFormFieldStatus emailStatus;
  @override
  final Color passwordBorderColor;
  @override
  final bool showPassword;
  @override
  final TextFormFieldStatus passwordStatus;
  @override
  final LoginStatus loginStatus;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginState &&
            (identical(other.emailSuffix, emailSuffix) ||
                other.emailSuffix == emailSuffix) &&
            (identical(other.emailBorderColor, emailBorderColor) ||
                other.emailBorderColor == emailBorderColor) &&
            (identical(other.emailStatus, emailStatus) ||
                other.emailStatus == emailStatus) &&
            (identical(other.passwordBorderColor, passwordBorderColor) ||
                other.passwordBorderColor == passwordBorderColor) &&
            (identical(other.showPassword, showPassword) ||
                other.showPassword == showPassword) &&
            (identical(other.passwordStatus, passwordStatus) ||
                other.passwordStatus == passwordStatus) &&
            (identical(other.loginStatus, loginStatus) ||
                other.loginStatus == loginStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      emailSuffix,
      emailBorderColor,
      emailStatus,
      passwordBorderColor,
      showPassword,
      passwordStatus,
      loginStatus);

  @override
  String toString() {
    return 'LoginState(emailSuffix: $emailSuffix, emailBorderColor: $emailBorderColor, emailStatus: $emailStatus, passwordBorderColor: $passwordBorderColor, showPassword: $showPassword, passwordStatus: $passwordStatus, loginStatus: $loginStatus)';
  }
}

/// @nodoc
abstract mixin class _$LoginStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(
          _LoginState value, $Res Function(_LoginState) _then) =
      __$LoginStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? emailSuffix,
      Color emailBorderColor,
      TextFormFieldStatus emailStatus,
      Color passwordBorderColor,
      bool showPassword,
      TextFormFieldStatus passwordStatus,
      LoginStatus loginStatus});
}

/// @nodoc
class __$LoginStateCopyWithImpl<$Res> implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(this._self, this._then);

  final _LoginState _self;
  final $Res Function(_LoginState) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? emailSuffix = freezed,
    Object? emailBorderColor = null,
    Object? emailStatus = null,
    Object? passwordBorderColor = null,
    Object? showPassword = null,
    Object? passwordStatus = null,
    Object? loginStatus = null,
  }) {
    return _then(_LoginState(
      emailSuffix: freezed == emailSuffix
          ? _self.emailSuffix
          : emailSuffix // ignore: cast_nullable_to_non_nullable
              as String?,
      emailBorderColor: null == emailBorderColor
          ? _self.emailBorderColor
          : emailBorderColor // ignore: cast_nullable_to_non_nullable
              as Color,
      emailStatus: null == emailStatus
          ? _self.emailStatus
          : emailStatus // ignore: cast_nullable_to_non_nullable
              as TextFormFieldStatus,
      passwordBorderColor: null == passwordBorderColor
          ? _self.passwordBorderColor
          : passwordBorderColor // ignore: cast_nullable_to_non_nullable
              as Color,
      showPassword: null == showPassword
          ? _self.showPassword
          : showPassword // ignore: cast_nullable_to_non_nullable
              as bool,
      passwordStatus: null == passwordStatus
          ? _self.passwordStatus
          : passwordStatus // ignore: cast_nullable_to_non_nullable
              as TextFormFieldStatus,
      loginStatus: null == loginStatus
          ? _self.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as LoginStatus,
    ));
  }
}

// dart format on
