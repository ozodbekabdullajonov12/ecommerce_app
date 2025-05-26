import 'package:equatable/equatable.dart';

abstract class DeleteCardState extends Equatable {
  const DeleteCardState();

  @override
  List<Object> get props => [];
}

class DeleteCardInitial extends DeleteCardState {}

class DeleteCardInProgress extends DeleteCardState {}

class DeleteCardSuccess extends DeleteCardState {}

class DeleteCardFailure extends DeleteCardState {
  final String message;

  const DeleteCardFailure(this.message);

  @override
  List<Object> get props => [message];
}
