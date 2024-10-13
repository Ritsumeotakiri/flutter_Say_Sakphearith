import 'dart:ffi';

void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];
  // You code
  //use where function
  var filterlist = scores.where((number) => number >= 50);
  //print the function with the toList() to show the list
  print(filterlist.toList());
  //print the string with the function .length to show how many number are there
  print('${filterlist.length} Students passed');
}
