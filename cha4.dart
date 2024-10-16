class Distance {
  final double _meters;

  Distance.cms(double cms) : _meters = cms / 100;
  Distance.meters(double meters) : _meters = meters;
  Distance.kms(double kms) : _meters = kms * 100;

  double get cms => _meters * 100;
  double get meter => _meters;
  double get kms => _meters / 1000;

  @override
  Distance operator + (Distance other) {
    return Distance.meters(this._meters + other._meters);
  }
}

void main() {
  Distance d1 = Distance.kms(3.4);
  Distance d2 = Distance.meters(1000);
  print((d1 + d2).kms);
}
