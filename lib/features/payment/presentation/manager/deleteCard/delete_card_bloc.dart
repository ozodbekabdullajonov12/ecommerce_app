import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../data/repositories/new_card_repository.dart';
import 'delete_card_event.dart';
import 'delete_card_state.dart';

class DeleteCardBloc extends Bloc<DeleteCardEvent, DeleteCardState> {
  final NewCardRepository repository;

  DeleteCardBloc({required this.repository}) : super(DeleteCardInitial()) {
    on<DeleteCardRequested>(_onDeleteCardRequested);
  }

  Future<void> _onDeleteCardRequested(
      DeleteCardRequested event, Emitter<DeleteCardState> emit) async {
    emit(DeleteCardInProgress());
    try {
      await repository.deleteCard(event.cardId);
      emit(DeleteCardSuccess());
    } catch (e) {
      emit(DeleteCardFailure('Cardni o‘chirishda xatolik yuz berdi: $e'));
    }
  }
}
