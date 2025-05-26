import 'package:equatable/equatable.dart';
import '../../../../../data/models/new_card_model.dart';

abstract class NewCardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SubmitNewCardEvent extends NewCardEvent {
  final NewCardModel newCard;

  SubmitNewCardEvent(this.newCard);

  @override
  List<Object?> get props => [newCard];
}
