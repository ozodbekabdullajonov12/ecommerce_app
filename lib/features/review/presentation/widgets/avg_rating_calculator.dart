class AvgRatingCalculator {
  final int oneStars, twoStars, threeStars, fourStars, fiveStars;

  AvgRatingCalculator({
    required this.oneStars,
    required this.twoStars,
    required this.threeStars,
    required this.fourStars,
    required this.fiveStars,
  });

  String calculateAverageRating() {
    int totalRatings = oneStars + twoStars + threeStars + fourStars + fiveStars;
    if (totalRatings == 0) {
      return "0.00";
    }

    double average = (1 * oneStars +
        2 * twoStars +
        3 * threeStars +
        4 * fourStars +
        5 * fiveStars) / totalRatings;

    return average.toStringAsFixed(2);
  }
}
