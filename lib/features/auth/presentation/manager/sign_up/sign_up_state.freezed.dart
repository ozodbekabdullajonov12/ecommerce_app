// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SignUpState {

 String? get fullNameSuffix; Color get fullNameBorderColor; TextFormFieldStatus get fullNameStatus; String? get emailSuffix; Color get emailBorderColor; TextFormFieldStatus get emailStatus; Color get passwordBorderColor; bool get showPassword; TextFormFieldStatus get passwordStatus; Color get cPasswordBorderColor; bool get cShowPassword; TextFormFieldStatus get cPasswordStatus;
/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpStateCopyWith<SignUpState> get copyWith => _$SignUpStateCopyWithImpl<SignUpState>(this as SignUpState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpState&&(identical(other.fullNameSuffix, fullNameSuffix) || other.fullNameSuffix == fullNameSuffix)&&(identical(other.fullNameBorderColor, fullNameBorderColor) || other.fullNameBorderColor == fullNameBorderColor)&&(identical(other.fullNameStatus, fullNameStatus) || other.fullNameStatus == fullNameStatus)&&(identical(other.emailSuffix, emailSuffix) || other.emailSuffix == emailSuffix)&&(identical(other.emailBorderColor, emailBorderColor) || other.emailBorderColor == emailBorderColor)&&(identical(other.emailStatus, emailStatus) || other.emailStatus == emailStatus)&&(identical(other.passwordBorderColor, passwordBorderColor) || other.passwordBorderColor == passwordBorderColor)&&(identical(other.showPassword, showPassword) || other.showPassword == showPassword)&&(identical(other.passwordStatus, passwordStatus) || other.passwordStatus == passwordStatus)&&(identical(other.cPasswordBorderColor, cPasswordBorderColor) || other.cPasswordBorderColor == cPasswordBorderColor)&&(identical(other.cShowPassword, cShowPassword) || other.cShowPassword == cShowPassword)&&(identical(other.cPasswordStatus, cPasswordStatus) || other.cPasswordStatus == cPasswordStatus));
}


@override
int get hashCode => Object.hash(runtimeType,fullNameSuffix,fullNameBorderColor,fullNameStatus,emailSuffix,emailBorderColor,emailStatus,passwordBorderColor,showPassword,passwordStatus,cPasswordBorderColor,cShowPassword,cPasswordStatus);

@override
String toString() {
  return 'SignUpState(fullNameSuffix: $fullNameSuffix, fullNameBorderColor: $fullNameBorderColor, fullNameStatus: $fullNameStatus, emailSuffix: $emailSuffix, emailBorderColor: $emailBorderColor, emailStatus: $emailStatus, passwordBorderColor: $passwordBorderColor, showPassword: $showPassword, passwordStatus: $passwordStatus, cPasswordBorderColor: $cPasswordBorderColor, cShowPassword: $cShowPassword, cPasswordStatus: $cPasswordStatus)';
}


}

/// @nodoc
abstract mixin class $SignUpStateCopyWith<$Res>  {
  factory $SignUpStateCopyWith(SignUpState value, $Res Function(SignUpState) _then) = _$SignUpStateCopyWithImpl;
@useResult
$Res call({
 String? fullNameSuffix, Color fullNameBorderColor, TextFormFieldStatus fullNameStatus, String? emailSuffix, Color emailBorderColor, TextFormFieldStatus emailStatus, Color passwordBorderColor, bool showPassword, TextFormFieldStatus passwordStatus, Color cPasswordBorderColor, bool cShowPassword, TextFormFieldStatus cPasswordStatus
});




}
/// @nodoc
class _$SignUpStateCopyWithImpl<$Res>
    implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._self, this._then);

  final SignUpState _self;
  final $Res Function(SignUpState) _then;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullNameSuffix = freezed,Object? fullNameBorderColor = null,Object? fullNameStatus = null,Object? emailSuffix = freezed,Object? emailBorderColor = null,Object? emailStatus = null,Object? passwordBorderColor = null,Object? showPassword = null,Object? passwordStatus = null,Object? cPasswordBorderColor = null,Object? cShowPassword = null,Object? cPasswordStatus = null,}) {
  return _then(_self.copyWith(
fullNameSuffix: freezed == fullNameSuffix ? _self.fullNameSuffix : fullNameSuffix // ignore: cast_nullable_to_non_nullable
as String?,fullNameBorderColor: null == fullNameBorderColor ? _self.fullNameBorderColor : fullNameBorderColor // ignore: cast_nullable_to_non_nullable
as Color,fullNameStatus: null == fullNameStatus ? _self.fullNameStatus : fullNameStatus // ignore: cast_nullable_to_non_nullable
as TextFormFieldStatus,emailSuffix: freezed == emailSuffix ? _self.emailSuffix : emailSuffix // ignore: cast_nullable_to_non_nullable
as String?,emailBorderColor: null == emailBorderColor ? _self.emailBorderColor : emailBorderColor // ignore: cast_nullable_to_non_nullable
as Color,emailStatus: null == emailStatus ? _self.emailStatus : emailStatus // ignore: cast_nullable_to_non_nullable
as TextFormFieldStatus,passwordBorderColor: null == passwordBorderColor ? _self.passwordBorderColor : passwordBorderColor // ignore: cast_nullable_to_non_nullable
as Color,showPassword: null == showPassword ? _self.showPassword : showPassword // ignore: cast_nullable_to_non_nullable
as bool,passwordStatus: null == passwordStatus ? _self.passwordStatus : passwordStatus // ignore: cast_nullable_to_non_nullable
as TextFormFieldStatus,cPasswordBorderColor: null == cPasswordBorderColor ? _self.cPasswordBorderColor : cPasswordBorderColor // ignore: cast_nullable_to_non_nullable
as Color,cShowPassword: null == cShowPassword ? _self.cShowPassword : cShowPassword // ignore: cast_nullable_to_non_nullable
as bool,cPasswordStatus: null == cPasswordStatus ? _self.cPasswordStatus : cPasswordStatus // ignore: cast_nullable_to_non_nullable
as TextFormFieldStatus,
  ));
}

}


/// @nodoc


class _SignUpState implements SignUpState {
  const _SignUpState({required this.fullNameSuffix, required this.fullNameBorderColor, required this.fullNameStatus, required this.emailSuffix, required this.emailBorderColor, required this.emailStatus, required this.passwordBorderColor, required this.showPassword, required this.passwordStatus, required this.cPasswordBorderColor, required this.cShowPassword, required this.cPasswordStatus});
  

@override final  String? fullNameSuffix;
@override final  Color fullNameBorderColor;
@override final  TextFormFieldStatus fullNameStatus;
@override final  String? emailSuffix;
@override final  Color emailBorderColor;
@override final  TextFormFieldStatus emailStatus;
@override final  Color passwordBorderColor;
@override final  bool showPassword;
@override final  TextFormFieldStatus passwordStatus;
@override final  Color cPasswordBorderColor;
@override final  bool cShowPassword;
@override final  TextFormFieldStatus cPasswordStatus;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignUpStateCopyWith<_SignUpState> get copyWith => __$SignUpStateCopyWithImpl<_SignUpState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignUpState&&(identical(other.fullNameSuffix, fullNameSuffix) || other.fullNameSuffix == fullNameSuffix)&&(identical(other.fullNameBorderColor, fullNameBorderColor) || other.fullNameBorderColor == fullNameBorderColor)&&(identical(other.fullNameStatus, fullNameStatus) || other.fullNameStatus == fullNameStatus)&&(identical(other.emailSuffix, emailSuffix) || other.emailSuffix == emailSuffix)&&(identical(other.emailBorderColor, emailBorderColor) || other.emailBorderColor == emailBorderColor)&&(identical(other.emailStatus, emailStatus) || other.emailStatus == emailStatus)&&(identical(other.passwordBorderColor, passwordBorderColor) || other.passwordBorderColor == passwordBorderColor)&&(identical(other.showPassword, showPassword) || other.showPassword == showPassword)&&(identical(other.passwordStatus, passwordStatus) || other.passwordStatus == passwordStatus)&&(identical(other.cPasswordBorderColor, cPasswordBorderColor) || other.cPasswordBorderColor == cPasswordBorderColor)&&(identical(other.cShowPassword, cShowPassword) || other.cShowPassword == cShowPassword)&&(identical(other.cPasswordStatus, cPasswordStatus) || other.cPasswordStatus == cPasswordStatus));
}


@override
int get hashCode => Object.hash(runtimeType,fullNameSuffix,fullNameBorderColor,fullNameStatus,emailSuffix,emailBorderColor,emailStatus,passwordBorderColor,showPassword,passwordStatus,cPasswordBorderColor,cShowPassword,cPasswordStatus);

@override
String toString() {
  return 'SignUpState(fullNameSuffix: $fullNameSuffix, fullNameBorderColor: $fullNameBorderColor, fullNameStatus: $fullNameStatus, emailSuffix: $emailSuffix, emailBorderColor: $emailBorderColor, emailStatus: $emailStatus, passwordBorderColor: $passwordBorderColor, showPassword: $showPassword, passwordStatus: $passwordStatus, cPasswordBorderColor: $cPasswordBorderColor, cShowPassword: $cShowPassword, cPasswordStatus: $cPasswordStatus)';
}


}

/// @nodoc
abstract mixin class _$SignUpStateCopyWith<$Res> implements $SignUpStateCopyWith<$Res> {
  factory _$SignUpStateCopyWith(_SignUpState value, $Res Function(_SignUpState) _then) = __$SignUpStateCopyWithImpl;
@override @useResult
$Res call({
 String? fullNameSuffix, Color fullNameBorderColor, TextFormFieldStatus fullNameStatus, String? emailSuffix, Color emailBorderColor, TextFormFieldStatus emailStatus, Color passwordBorderColor, bool showPassword, TextFormFieldStatus passwordStatus, Color cPasswordBorderColor, bool cShowPassword, TextFormFieldStatus cPasswordStatus
});




}
/// @nodoc
class __$SignUpStateCopyWithImpl<$Res>
    implements _$SignUpStateCopyWith<$Res> {
  __$SignUpStateCopyWithImpl(this._self, this._then);

  final _SignUpState _self;
  final $Res Function(_SignUpState) _then;

/// Create a copy of SignUpState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullNameSuffix = freezed,Object? fullNameBorderColor = null,Object? fullNameStatus = null,Object? emailSuffix = freezed,Object? emailBorderColor = null,Object? emailStatus = null,Object? passwordBorderColor = null,Object? showPassword = null,Object? passwordStatus = null,Object? cPasswordBorderColor = null,Object? cShowPassword = null,Object? cPasswordStatus = null,}) {
  return _then(_SignUpState(
fullNameSuffix: freezed == fullNameSuffix ? _self.fullNameSuffix : fullNameSuffix // ignore: cast_nullable_to_non_nullable
as String?,fullNameBorderColor: null == fullNameBorderColor ? _self.fullNameBorderColor : fullNameBorderColor // ignore: cast_nullable_to_non_nullable
as Color,fullNameStatus: null == fullNameStatus ? _self.fullNameStatus : fullNameStatus // ignore: cast_nullable_to_non_nullable
as TextFormFieldStatus,emailSuffix: freezed == emailSuffix ? _self.emailSuffix : emailSuffix // ignore: cast_nullable_to_non_nullable
as String?,emailBorderColor: null == emailBorderColor ? _self.emailBorderColor : emailBorderColor // ignore: cast_nullable_to_non_nullable
as Color,emailStatus: null == emailStatus ? _self.emailStatus : emailStatus // ignore: cast_nullable_to_non_nullable
as TextFormFieldStatus,passwordBorderColor: null == passwordBorderColor ? _self.passwordBorderColor : passwordBorderColor // ignore: cast_nullable_to_non_nullable
as Color,showPassword: null == showPassword ? _self.showPassword : showPassword // ignore: cast_nullable_to_non_nullable
as bool,passwordStatus: null == passwordStatus ? _self.passwordStatus : passwordStatus // ignore: cast_nullable_to_non_nullable
as TextFormFieldStatus,cPasswordBorderColor: null == cPasswordBorderColor ? _self.cPasswordBorderColor : cPasswordBorderColor // ignore: cast_nullable_to_non_nullable
as Color,cShowPassword: null == cShowPassword ? _self.cShowPassword : cShowPassword // ignore: cast_nullable_to_non_nullable
as bool,cPasswordStatus: null == cPasswordStatus ? _self.cPasswordStatus : cPasswordStatus // ignore: cast_nullable_to_non_nullable
as TextFormFieldStatus,
  ));
}


}

// dart format on
