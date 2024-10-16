// Class Tree
class Tree {
  String type;
  double height;

  Tree(this.type, this.height);
}

class Window {
  String colors;
  num windows;

  Window(this.windows, this.colors);
}

class Chimney {
  double height;

  Chimney(this.height);
}

class Roof {
  String type;

  Roof(this.type);
}

class Door {
  String color;
  Door(this.color);
}

// Class House
class House {
  String address;
  int level;

  List<Tree> trees = []; // by default empty
  List<Window> windows = [];
  List<Roof> roofs = [];
  List<Chimney> chimney = [];
  List<Door> door = [];

  House(this.address, this.level);

  void addDoor(Door newDoor) {
    this.door.add(newDoor);
  }

  void addChimney(Chimney newChimney) {
    this.chimney.add(newChimney);
  }

  void addTree(Tree newTree) {
    this.trees.add(newTree);
  }

  void addWindow(Window newWindow) {
    windows.add(newWindow); // Method to add a window
  }

  void addroof(Roof newRoof) {
    roofs.add(newRoof);
  }
}

void main() {
  House myHouse = House("123 Main St", 2);

  Roof roofType = Roof("triangle");
  Chimney chimneyheight = Chimney(2);
  Door doorColor = Door("brown");
  Tree tree = Tree("sakura", 5);

  Window window1 = Window(2, "blue");
  Window window2 = Window(3, "green");

  myHouse.addWindow(window1);
  myHouse.addWindow(window2);
  myHouse.addTree(tree);
  myHouse.addroof(roofType);
  myHouse.addChimney(chimneyheight);
  myHouse.addDoor(doorColor);

  print("House Address: ${myHouse.address}");
  print("Windows: ${myHouse.windows.length}");
  print("Roof: ${myHouse.roofs.first.type}");
  print("chimney height: ${myHouse.chimney.first.height} m");
  print("Door color: ${myHouse.door.first.color}");
}
