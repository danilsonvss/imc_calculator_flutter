class Calculator {
  final double _height;
  final double _weight;

  Calculator(this._height, this._weight);

  double get result {
    if (_weight == 0 || _height == 0) {
      return 0;
    }

    return _weight / (_height * _height);
  }
}