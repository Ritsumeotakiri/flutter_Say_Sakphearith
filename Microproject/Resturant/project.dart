import 'dart:io';
import 'services/menu_services.dart';
import 'testing/order.dart';
import 'testing/test_res.dart';

void main() {
  final menuServices = MenuServices();

  while (true) {
    print("\n--- Restaurant System ---");
    print("1. Show Menu");
    print("2. Add Order");
    print("3. resevation");
    print("4. Exit");
    stdout.write("Choose an option: ");
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        menuServices.showMenu();
        break;
      case '2':
        order();
        break;
      case '3':
        reservation();
      case '4':
        return;

      default:
        print("Invalid option. Please try again.");
    }
  }
}
