part of "my_details_bloc.dart";
sealed class MyDetailsEvent{}

final class MyDetailsLoad extends MyDetailsEvent{}
final class FullNameValidationFailed extends MyDetailsEvent{}

final class FullNameValidationSuccess extends MyDetailsEvent{}

final class EmailValidationFailed extends MyDetailsEvent{}

final class EmailValidationSuccess extends MyDetailsEvent{}

