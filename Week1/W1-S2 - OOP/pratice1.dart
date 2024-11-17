enum Country { CAMBODIA, FRANCE, USA }

class Address {
  final Country country;

  final String city;

  final String street;

  Address(
      {this.country = Country.CAMBODIA,
      required this.city,
      required this.street});

  String toString() {
    return "$country - $city - $street";
  }
}

class Room {
  final int? amount;
  Room(this.amount);
}

class Roof {
  String type;

  Roof(this.type);
}

class Door {
  String color;
  int amount;
  String position;
  Door(this.color, this.amount, this.position);
}

class Chimney {
  double height;
  String position;

  Chimney(this.height,this.position);
}

class Window {
  String position;
  Window(this.position);

  String toString() {
    return "$position";
  }
}

class House {
  final Address address;
  final List<Room> rooms = [];
  final List<Roof> roofs = [];
  final List<Door> doors = [];
  final List<Chimney> chimney = [];
  final List<Window> windows = [];

  House({required this.address});

  void addWindow(Window newWindow) {
    windows.add(newWindow);
  }

  void addDoor(Door newDoor) {
    doors.add(newDoor);
  }

  void addRoof(Roof newRoof) {
    this.roofs.add(newRoof);
  }

  void addRoom(Room newRoom) {
    this.rooms.add(newRoom);
  }

  void addchimny(Chimney newChimny) {
    this.chimney.add(newChimny);
  }
}

main() {
  House myhouse = House(address: Address(street: "CADT", city: "SiemReap"));
  Roof roofType = Roof("triangle");
  Door door = Door("brown", 2, "ground_middle");
  Chimney chimney = Chimney(2.3, "left of roof");
  Window window1 = Window("firsr_floor_right");
  Window window2 = Window("first_floor_left");

  myhouse.addDoor(door);
  myhouse.addchimny(chimney);
  myhouse.addRoof(roofType);
  myhouse.addWindow(window1);
  myhouse.addWindow(window2);

  print("this is my house");
  print(myhouse.address);
  print(
      "Door: ${myhouse.doors.first.amount}, color:${myhouse.doors.first.color}, ${myhouse.doors.first.position}");
  print("chimney: ${myhouse.chimney.first.height}m , position: ${myhouse.chimney.first.position}");
  print("roof: ${myhouse.roofs.first.type}");
  print("Window1: ${myhouse.windows[0]} window2:${myhouse.windows[1]}");
}
