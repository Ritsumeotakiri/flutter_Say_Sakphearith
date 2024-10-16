class Distance {
  final double _meters; // make immutability by using final

  //create construnctor for cms,meter, and kms it can convert to other unit
  Distance.cms(double cms) : _meters = cms / 100;
  Distance.meters(double meters) : _meters = meters;
  Distance.kms(double kms) : _meters = kms * 100;

  //use getter  to convert to other unit
  double get cms => _meters * 100;
  double get meter => _meters;
  double get kms => _meters / 1000;

  //operation to plus the unit that convert and than can convert to the other unit that command
  Distance operator + (Distance other) {
    return Distance.meters(this._meters + other._meters);
  }
}

void main() {
  Distance d1 = Distance.kms(3.4);
  Distance d2 = Distance.meters(1000);
  print((d1 + d2).kms);
}
