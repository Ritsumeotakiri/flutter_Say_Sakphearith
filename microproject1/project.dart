import 'dart:io';

enum FoodMenu {
  Pizza(8.99),
  Burger(5.49),
  Pasta(7.99),
  Sushi(12.49),
  Salad(4.99);

  final double price;
  const FoodMenu(this.price);
}

class OrderFood {
  final Map<FoodMenu, int> _orderSummary = {};

  void showMenu() {
    print("Menu:");
    for (var i = 0; i < FoodMenu.values.length; i++) {
      print(
          "${i + 1}. ${FoodMenu.values[i].name} - \$${FoodMenu.values[i].price.toStringAsFixed(2)}");
    }
  }

  void addOrder(int choice) {
    if (choice > 0 && choice <= FoodMenu.values.length) {
      var selectedFood = FoodMenu.values[choice - 1];
      _orderSummary.update(selectedFood, (qty) => qty + 1, ifAbsent: () => 1);
      print("Added ${selectedFood.name} to your order.");
    } else {
      print("Invalid choice. Please try again.");
    }
  }

  void showSummary() {
    if (_orderSummary.isEmpty) {
      print("\nNo items ordered.");
      return;
    }

    print("\nOrder Summary:");
    double total = 0.0;

    _orderSummary.forEach((item, quantity) {
      double itemTotal = item.price * quantity;
      total += itemTotal;
      print("${item.name} x $quantity = \$${itemTotal.toStringAsFixed(2)}");
    });

    print("\nTotal: \$${total.toStringAsFixed(2)}");
  }
}

void main() {
  OrderFood orderFood = OrderFood();

  while (true) {
    orderFood.showMenu();

    stdout.write(
        "\nEnter the number of the food you want to order (or 0 to finish): ");
    String? input = stdin.readLineSync();

    if (input == null || input.isEmpty) {
      print("Invalid input. Please enter a number.");
      continue;
    }

    int choice = int.tryParse(input) ?? -1;

    if (choice == 0) {
      orderFood.showSummary();
      print("Thank you for your order!");
      break;
    }

    orderFood.addOrder(choice);
  }
}
