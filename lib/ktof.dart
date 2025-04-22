import 'package:assignment/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TemperatureApp());
}

class TemperatureApp extends StatelessWidget {
  const TemperatureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kelvin to Fahrenheit',
      home: Converter(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Converter extends StatefulWidget {
  const Converter({super.key});

  @override
  _TemperatureConverter createState() => _TemperatureConverter();
}

class _TemperatureConverter extends State<Converter> {
  double F = 0;
  final TextEditingController _kelvintem = TextEditingController();
  String _fahrenheit = "";

  void _convertTemperature() {
    double? kelvin = double.tryParse(_kelvintem.text);
    if (kelvin != null) {
      double fahrenheit = (kelvin - 273.15) * 9 / 5 + 32;
      setState(() {
        _fahrenheit = "${fahrenheit.toStringAsFixed(2)} °F";
      });
    } else {
      setState(() {
        _fahrenheit = "Please enter a valid number.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kelvin to Fahrenheit')),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _kelvintem,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Temperature in Kelvin',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertTemperature,
              child: Text('Convert'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
              child: Text('Go Back HomePage'),
            ),
            SizedBox(height: 20),
            Text(
              _fahrenheit,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
