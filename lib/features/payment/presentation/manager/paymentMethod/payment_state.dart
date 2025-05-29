import 'package:equatable/equatable.dart';
import 'package:store/data/models/card_model.dart';

enum PaymentStatus { idle, loading, error }

class PaymentState extends Equatable {
  final List<CardModel>? cards;
  final PaymentStatus status;

  PaymentState({required this.cards, required this.status});

  @override
  List<Object?> get props => [cards, status];

  factory PaymentState.initial() {
    return PaymentState(cards: [], status: PaymentStatus.loading);
  }

  PaymentState copyWith({List<CardModel>? cards, PaymentStatus? status}) {
    return PaymentState(cards: cards ?? this.cards, status: status ?? this.status);
  }
}
