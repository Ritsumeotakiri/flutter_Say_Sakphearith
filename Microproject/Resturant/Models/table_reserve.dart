class TableReservation {
  final int tableNumber;
  final int capacity;
  bool isReserved = false;
  DateTime? reservationTime;
  String? reservedBy;

  TableReservation(this.tableNumber, this.capacity);

  bool reserveTable(String customerName, DateTime time) {
    if (isReserved) {
      print("Table $tableNumber is already reserved.");
      return false;
    } else {
      isReserved = true;
      reservedBy = customerName;
      reservationTime = time;
      print("Table $tableNumber reserved by $customerName at $time.");
      return true;
    }
  }

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

  @override
  String toString() {
    if (isReserved) {
      return "Table $tableNumber is reserved by $reservedBy for $reservationTime.";
    } else {
      return "Table $tableNumber is available.";
    }
  }
}
