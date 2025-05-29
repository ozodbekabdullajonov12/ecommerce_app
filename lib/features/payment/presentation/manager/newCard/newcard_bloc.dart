import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../data/repositories/new_card_repository.dart';
import 'newcard_event.dart';
import 'newcard_state.dart';

class NewCardBloc extends Bloc<NewCardEvent, NewCardState> {
  final NewCardRepository repository;

  NewCardBloc({required this.repository}) : super(NewCardInitial()) {
    on<SubmitNewCardEvent>(_onSubmitNewCard);
  }

  Future<void> _onSubmitNewCard(
      SubmitNewCardEvent event,
      Emitter<NewCardState> emit,
      ) async {
    emit(NewCardSubmitting());

    try {
      await repository.createCard(event.newCard);
      emit(NewCardSuccess());
    } catch (e) {
      emit(NewCardFailure(e.toString()));
    }
  }
}
