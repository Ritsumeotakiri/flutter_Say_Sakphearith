import 'dart:io';
import '../Models/table_reserve.dart';
import '../services/reservation_services.dart';

void reservation() {
  List<TableReservation> tables = [
    TableReservation(1, 4),
    TableReservation(2, 2),
    TableReservation(3, 6),
  ];

  var reservationService = ReservationService(tables);

  while (true) {
    reservationService.showMenu();
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        reservationService.viewTables();
        break;
      case '2':
        reservationService.reserveTable();
        break;
      case '3':
        reservationService.cancelReservation();
        break;
      case '4':
        print("Exiting the Table Reservation System.");
        return;
      default:
        print("Invalid option. Please try again.");
    }
  }
}
