import 'package:equatable/equatable.dart';

abstract class NewCardState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewCardInitial extends NewCardState {}

class NewCardSubmitting extends NewCardState {}

class NewCardSuccess extends NewCardState {}

class NewCardFailure extends NewCardState {
  final String error;

  NewCardFailure(this.error);

  @override
  List<Object?> get props => [error];
}
