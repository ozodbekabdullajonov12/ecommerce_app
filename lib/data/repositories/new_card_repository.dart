import '../../core/client.dart';
import '../models/new_card_model.dart';

class NewCardRepository {
  final ApiClient client;

  NewCardRepository({required this.client});

  Future<void> createCard(NewCardModel card) async {
    await client.postCard(card);
  }

  Future<List<dynamic>> getCards() async {
    return await client.fetchCards();
  }

  Future<void> deleteCard(String cardId) async {
    await client.deleteCard(cardId);
  }
}
