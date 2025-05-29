class NewCardModel {
  final String cardNumber;
  final DateTime expiryDate;
  final String securityCode;

  NewCardModel({
    required this.cardNumber,
    required this.expiryDate,
    required this.securityCode,
  });

  Map<String, dynamic> toJson() {
    String formattedExpiry =
        '${expiryDate.year}-${expiryDate.month.toString().padLeft(2, '0')}-${expiryDate.day.toString().padLeft(2, '0')}';

    return {
      'cardNumber': cardNumber,
      'expiryDate': formattedExpiry,
      'securityCode': securityCode,
    };
  }
}
DateTime convertExpiryToDateTime(String input) {
  try {
    List<String> parts = input.split('/');
    if (parts.length != 2) {
      throw FormatException("Noto‘g‘ri format");
    }
    String month = parts[0].padLeft(2, '0');
    String year = '20${parts[1]}';

    return DateTime(int.parse(year), int.parse(month), 1);
  } catch (e) {
    throw FormatException("Expiry date noto‘g‘ri: $input");
  }
}


