part of 'payment_bloc.dart';

sealed class PaymentEvent {}

final class PaymentLoading extends PaymentEvent {}

final class DeleteCardEvent extends PaymentEvent {
  final String cardId;

  DeleteCardEvent(this.cardId);
}
