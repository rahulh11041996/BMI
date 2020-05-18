import 'dart:math';

class BmiCalculatorBrain {
  BmiCalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;
  double lst = 24;

  String calculator() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String statusString() {
    double data = weight / pow(height / 100, 2);
    if (data >= 25) {
      return 'OVERWEIGHT';
    } else if (data > 18.5 && data < 25) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String fetchValue() {
    double data = weight / pow(height / 100, 2);
    if (data >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (data > 18.5 && data < 25) {
      return 'You have a normal body weight. Good Job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
