import 'dart:io';
import 'order.dart'; 
import 'table_reserve.dart'; 

void main() {
  while (true) {
    print("\n--- Welcome to the Restaurant ---");
    print("1. Order");
    print("2. Reserve a Table");
    print("3. Exit");

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        orders();
        break;
      case '2':
        reservation();
        break;
      case '3':
        print("Thank you for visiting! Goodbye!");

        return; 

      default:
        print("Invalid choice. Please try again.");
    }
  }
}
