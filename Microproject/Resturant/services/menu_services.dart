import '../Models/menu.dart';

class MenuServices {
  void showMenu() {
    print("Menu:");
    for (var i = 0; i < FoodMenu.values.length; i++) {
      print(
          "${i + 1}. ${FoodMenu.values[i].name} - \$${FoodMenu.values[i].price.toStringAsFixed(2)}");
    }
  }
}
