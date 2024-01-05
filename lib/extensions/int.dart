extension Currency on int {
  String toProfit() {
    List<String> str = toString().split('').reversed.toList();
    List<String> profit = [];

    int counter = 0;
    for (int i = 0; i < str.length; i++) {
      profit.add(str[i]);
      counter += 1;

      if (counter == 3) {
        profit.add(',');
        counter = 0;
      }
    }

    final String price = profit.reversed.join('');
    return '$price.00';
  }
}
