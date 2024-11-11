import '../Models/menu.dart';
import '../Models/order.dart';

class OrderServices {
  final OrderFood _orderFood;

  OrderServices(this._orderFood);

  void addOrder(int choice) {
    if (choice > 0 && choice <= FoodMenu.values.length) {
      var selectedFood = FoodMenu.values[choice - 1];
      _orderFood.addToOrder(selectedFood);
      print("Added ${selectedFood.name} to your order.");
    } else {
      print("Invalid choice. Please try again.");
    }
  }

  void showReceipt() {
    final orderSummary = _orderFood.getOrderSummary();

    if (orderSummary.isEmpty) {
      print("\nNo items ordered.");
      return;
    }

    print("\nOrder Summary:");
    orderSummary.forEach((item, quantity) {
      double itemTotal = item.price * quantity;
      print("${item.name} x $quantity = \$${itemTotal.toStringAsFixed(2)}");
    });

    print("\nTotal: \$${_orderFood.calculateTotal().toStringAsFixed(2)}");
  }
}
