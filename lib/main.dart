import 'package:flutter/material.dart';

void main() => runApp(BMICalculatorApp());

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  int _feet = 5;
  int _inches = 6;
  double _weight = 60; // in kilograms
  int _age = 25;
  double _bmi = 0;
  String _bmiCategory = '';

  void _calculateBMI() {
    setState(() {
      int heightInInches = _feet * 12 + _inches;
      double heightInCentimeters = heightInInches * 2.54;
      _bmi = _weight / ((heightInCentimeters / 100) * (heightInCentimeters / 100));

      if (_bmi < 16.0) {
        _bmiCategory = 'Severely Underweight';
      } else if (_bmi >= 16.0 && _bmi < 18.5) {
        _bmiCategory = 'Underweight';
      } else if (_bmi >= 18.5 && _bmi < 25.0) {
        _bmiCategory = 'Normal';
      } else if (_bmi >= 25.0 && _bmi < 30.0) {
        _bmiCategory = 'Overweight';
      } else if (_bmi >= 30.0 && _bmi < 35.0) {
        _bmiCategory = 'Moderately Obese';
      } else if (_bmi >= 35.0 && _bmi < 40.0) {
        _bmiCategory = 'Severely Obese';
      } else {
        _bmiCategory = 'Morbidly Obese';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Height (feet)',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _feet = int.tryParse(value) ?? 0;
                      });
                    },
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Height (inches)',
                    ),
                    onChanged: (value) {
                      setState(() {
                        _inches = int.tryParse(value) ?? 0;
                      });
                    },
                  ),
                ),
              ],
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Weight (kg)',
              ),
              onChanged: (value) {
                setState(() {
                  _weight = double.tryParse(value) ?? 0;
                });
              },
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Age',
              ),
              onChanged: (value) {
                setState(() {
                  _age = int.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _calculateBMI();
              },
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 16.0),
            Text(
              'BMI: ${_bmi.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Category: $_bmiCategory',
              style: TextStyle(fontSize: 18.0, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
