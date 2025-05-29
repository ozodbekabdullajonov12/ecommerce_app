class CardModel {
  final int id;
  final String cardNum;

  CardModel({required this.id, required this.cardNum});

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(id: json['id'], cardNum: json['cardNumber']);
  }
}
