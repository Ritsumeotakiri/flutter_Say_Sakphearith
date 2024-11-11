import 'dart:io';
import '../Models/table_reserve.dart';

class ReservationService {
  final List<TableReservation> _tables;

  ReservationService(this._tables);

  void showMenu() {
    print("\n--- Table Reservation ---");
    print("1. View all tables");
    print("2. Reserve a table");
    print("3. Cancel a reservation");
    print("4. Exit");
    stdout.write("Choose an option: ");
  }

  void viewTables() {
    for (var table in _tables) {
      print(table);
    }
  }

  void reserveTable() {
    stdout.write("Enter table number to reserve: ");
    int? tableNumber = int.tryParse(stdin.readLineSync() ?? '');

    if (tableNumber == null ||
        tableNumber < 1 ||
        tableNumber > _tables.length) {
      print("Invalid table number.");
      return;
    }

    stdout.write("Enter your name: ");
    String? name = stdin.readLineSync();

    if (name == null || name.isEmpty) {
      print("Invalid name.");
      return;
    }

    stdout.write(
        "Enter reservation hour from now (e.g., 1 for 1 hour from now): ");
    int? hours = int.tryParse(stdin.readLineSync() ?? '');

    if (hours == null || hours < 0) {
      print("Invalid hour.");
      return;
    }

    bool reserved = _tables[tableNumber - 1]
        .reserveTable(name, DateTime.now().add(Duration(hours: hours)));

    if (!reserved) {
      print("Failed to reserve table.");
    }
  }

  void cancelReservation() {
    stdout.write("Enter table number to cancel reservation: ");
    int? tableNumber = int.tryParse(stdin.readLineSync() ?? '');

    if (tableNumber == null ||
        tableNumber < 1 ||
        tableNumber > _tables.length) {
      print("Invalid table number.");
      return;
    }

    _tables[tableNumber - 1].cancelReservation();
  }
}
