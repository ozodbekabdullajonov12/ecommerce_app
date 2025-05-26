import 'package:store/core/client.dart';
import 'package:store/data/models/card_model.dart';

class PaymentRepository {
  final ApiClient client;
  List<CardModel> cards = [];

  PaymentRepository({required this.client});

  Future<List<CardModel>> fetchCards() async {
    var rawCards = await client.fetchCards();
    cards = rawCards.map((e) => CardModel.fromJson(e)).toList();
    return cards;
  }

  Future<void> deleteCard(String cardId) async {
    await client.deleteCard(cardId);
    cards.removeWhere((card) => card.id == cardId);
  }
}
