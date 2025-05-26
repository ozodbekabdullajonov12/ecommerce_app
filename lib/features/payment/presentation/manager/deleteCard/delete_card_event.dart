import 'package:equatable/equatable.dart';

abstract class DeleteCardEvent extends Equatable {
  const DeleteCardEvent();

  @override
  List<Object> get props => [];
}

class DeleteCardRequested extends DeleteCardEvent {
  final String cardId;

  const DeleteCardRequested(this.cardId);

  @override
  List<Object> get props => [cardId];
}
