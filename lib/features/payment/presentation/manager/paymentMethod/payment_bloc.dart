import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/data/repositories/payment_repository.dart';
import 'package:store/features/payment/presentation/manager/paymentMethod/payment_state.dart';

import '../../../../../data/models/card_model.dart';

part 'payment_event.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentRepository _repo;

  PaymentBloc({required PaymentRepository repo}) : _repo = repo, super(PaymentState.initial()) {
    on<PaymentLoading>(_loading);
    on<DeleteCardEvent>(_deleteCard);
    add(PaymentLoading());
  }

  Future<void> _loading(PaymentLoading event, Emitter<PaymentState> emit) async {
    emit(state.copyWith(status: PaymentStatus.loading));
    final cards = await _repo.fetchCards();
    emit(PaymentState(cards: cards, status: PaymentStatus.idle));
  }

  Future<void> _deleteCard(DeleteCardEvent event, Emitter<PaymentState> emit) async {
    try {
      emit(state.copyWith(status: PaymentStatus.loading));
      await _repo.deleteCard(event.cardId);
      final updatedCards = List<CardModel>.from(_repo.cards);
      emit(PaymentState(cards: updatedCards, status: PaymentStatus.idle));
    } catch (_) {
      emit(state.copyWith(status: PaymentStatus.error));
    }
  }
}
