import 'dart:io';

//class for table reservation
class TableReservation {
  final int tableNumber;
  final int capacity;
  bool isReserved = false;
  DateTime? reservationTime;
  String? reservedBy; 

  // Constructor
  TableReservation(this.tableNumber, this.capacity);

  // Method to reserve the table for a specific customer at a specific time
  bool reserveTable(String customerName, DateTime time) {
    if (isReserved) {
      print("Table $tableNumber is already reserved.");
      return false; // Reservation failed because the table is already reserved
    } else {
      isReserved = true;
      reservedBy = customerName;
      reservationTime = time;
      print("Table $tableNumber reserved by $customerName at $time.");
      return true;
    }
  }

  // Method to cancel the reservation for the table
  void cancelReservation() {
    if (!isReserved) {
      print("Table $tableNumber is not currently reserved.");
    } else {
      print(
          "Reservation for table $tableNumber by $reservedBy has been cancelled.");
      isReserved = false;
      reservedBy = null;
      reservationTime = null;
    }
  }

  // Overriding toString() to provide a user-friendly display of table status
  @override
  String toString() {
    if (isReserved) {
      return "Table $tableNumber is reserved by $reservedBy for $reservationTime.";
    } else {
      return "Table $tableNumber is available.";
    }
  }
}

void reservation() {
  // Initialize a list of tables with different capacities
  List<TableReservation> tables = [
    TableReservation(1, 4),
    TableReservation(2, 2),
    TableReservation(3, 6)
  ];

  // Continuous loop to keep the program running until user decides to exit
  while (true) {
    // Display menu options for user interaction
    print("\n--- Table Reservation ---");
    print("1. View all tables");
    print("2. Reserve a table");
    print("3. Cancel a reservation");
    print("4. Exit");
    stdout.write("Choose an option: ");
    String? choice = stdin.readLineSync();

    // Handle user's choice
    switch (choice) {
      case '1':
        // Display all tables and their current reservation status
        for (var table in tables) {
          print(table);
        }
        break;

      case '2':
        // Option to reserve a table
        stdout.write("Enter table number to reserve: ");
        int? tableNumber = int.tryParse(stdin.readLineSync() ?? '');

        // Check if entered table number is valid
        if (tableNumber == null ||
            tableNumber < 1 ||
            tableNumber > tables.length) {
          print("Invalid table number.");
          break;
        }

        stdout.write("Enter your name: ");
        String? name = stdin.readLineSync();

        // Ensure the entered name is valid
        if (name == null || name.isEmpty) {
          print("Invalid name.");
          break;
        }

        stdout.write(
            "Enter reservation hour from now (e.g., 1 for 1 hour from now): ");
        int? hours = int.tryParse(stdin.readLineSync() ?? '');

        // Check if the entered hour offset is valid
        if (hours == null || hours < 0) {
          print("Invalid hour.");
          break;
        }

        // Attempt to reserve the table with the given details
        bool reserved = tables[tableNumber - 1]
            .reserveTable(name, DateTime.now().add(Duration(hours: hours)));

        // If reservation fails, print a message
        if (!reserved) {
          print("Failed to reserve table.");
        }
        break;

      case '3':
        // Option to cancel an existing reservation
        stdout.write("Enter table number to cancel reservation: ");
        int? tableNumber = int.tryParse(stdin.readLineSync() ?? '');

        // Check if entered table number is valid
        if (tableNumber == null ||
            tableNumber < 1 ||
            tableNumber > tables.length) {
          print("Invalid table number.");
          break;
        }

        // Cancel the reservation for the specified table
        tables[tableNumber - 1].cancelReservation();
        break;

      case '4':
        // Exit the program
        print("Exiting the Table Reservation System.");
        return;

      default:
        // Handle invalid options
        print("Invalid option. Please try again.");
    }
  }
}

void main() {
  reservation();
}
