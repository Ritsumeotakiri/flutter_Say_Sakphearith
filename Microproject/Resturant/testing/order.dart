import '../Models/order.dart';
import '../services/order_services.dart';
import '../services/menu_services.dart';
import 'dart:io';

void order() {
  var order = OrderFood();
  var services = OrderServices(order);
  var manuservices = MenuServices();

  while (true) {
    manuservices.showMenu();
    stdout.write("Enter your choice (or 0 to finish): ");
    var input = int.tryParse(stdin.readLineSync() ?? '');
    if (input == null || input < 0) {
      print("Invalid input. Try again.");
      continue;
    }

    if (input == 0) break;

    services.addOrder(input);
  }

  services.showReceipt();
}

void main() {}
