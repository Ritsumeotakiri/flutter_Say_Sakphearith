import 'menu.dart';

class OrderFood {
  final Map<FoodMenu, int> _orderSummary = {};

  Map<FoodMenu, int> get orderSummary => _orderSummary;

  void addToOrder(FoodMenu item) {
    _orderSummary.update(item, (qty) => qty + 1, ifAbsent: () => 1);
  }

  Map<FoodMenu, int> getOrderSummary() => _orderSummary;

  double calculateTotal() {
    return _orderSummary.entries
        .map((entry) => entry.key.price * entry.value)
        .fold(0.0, (prev, curr) => prev + curr);
  }
}
