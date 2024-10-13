enum Direction { north, east, south, west }

// i create a control class to give make method like turn R L and advace
//i also create a functio which read the instruction in it we have turn L,R and foward
//
class control{
  int x;
  int y;
  Direction direction;
  control(this.x,this.y,this.direction);
  
  void instructions(String instruction){
    for (var instruction in instruction.split('')){// make the string split so that it can read one by one
      switch (instruction){
        case 'R':
          turnRight();
          break;
        case 'L':
          turnLeft();
          break;
        case 'A':
          advance(1);
          break;
      }
    }
  }
  //give the instruction of the advance method to move on where it facing
  // like: 
  //                 N
  //               W -> E     
  //                 S
  //so that if it facing which direction it will add according to the (X and Y)
  void advance(int distance) {
    switch (direction) {
      case Direction.north:
        y += distance;
        break;
      case Direction.east:
        x += distance;
        break;
      case Direction.south:
        y -= distance;
        break;
      case Direction.west:
        x -= distance;
        break;
    }
  }
  
  

  // to give the condition of facing where when turn L
  Direction _turnLeft(Direction currentDirection){
    switch (currentDirection){
      case Direction.north:
        return Direction.west;
       case Direction.east:
        return Direction.north;
      case Direction.south:
        return Direction.east;
      case Direction.west:
        return Direction.south; 
    }
  }

// to give the condition of facing where when turn R
  Direction _turnRight(Direction currentDirection) {
    switch (currentDirection) {
      case Direction.north:
        return Direction.east;
      case Direction.east:
        return Direction.south;
      case Direction.south:
        return Direction.west;
      case Direction.west:
        return Direction.north;
    }
  }
   void turnLeft() {
    direction = _turnLeft(direction);
  }

  void turnRight() {
    direction = _turnRight(direction);
  }

  //function to return the result
  String position() {
    return '($x, $y)'; 
  }
  String todirections(){
    return '${direction.name}';
  }

}
void main() {
  // Initial position {7, 3} and facing north
  int x = 7;
  int y = 3;
  Direction direction = Direction.north;

  // Example instruction sequence
  const instructions = "RAALAL";

  // Process the instructions and get the final position and direction
  control controls = control(x, y, direction);
  
  controls.instructions('$instructions');

  // Print the final position and direction
  
  print("Final position: ${controls.position()}  ");
  print("Facing:${controls.todirections()}  ");
}

