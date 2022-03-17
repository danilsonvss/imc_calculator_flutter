class Calculator {
  final double _height;
  final double _weight;

  double get imc => _weight / (_height * _height);

  Calculator(this._height, this._weight);
}