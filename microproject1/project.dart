import 'dart:io';
import 'order.dart'; // Assuming this contains order-related functionalities
import 'table_reserve.dart'; // Assuming this contains reservation-related functionalities

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

        return; // Exit the loop and end the program

      default:
        print("Invalid choice. Please try again.");
    }
  }
}
