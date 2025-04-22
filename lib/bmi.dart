import 'package:assignment/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BMIAPP());
}

class BMIAPP extends StatelessWidget {
  const BMIAPP({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double BMI = 0;
  final TextEditingController w = TextEditingController();
  final TextEditingController hfeet = TextEditingController();
  final TextEditingController hinch = TextEditingController();
  String r = "BMI = 0.0";
  void BMI_Calculation() {
    double? weight = double.parse(w.text);
    double? heightfeet = double.parse(hfeet.text);
    double? heightinchh = double.parse(hinch.text);
    if (weight != null && heightfeet != null && heightinchh != null) {
      heightfeet = heightfeet * 0.3048;
      heightinchh = heightinchh * 0.0254;
      double total_height = heightfeet + heightinchh;
      BMI = weight / (total_height * total_height);
      setState(() {
        r = "BMI = ${BMI.toStringAsFixed(2)}";
      });
    } else {
      setState(() {
        r = "Please complete the boxes";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Measurement'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: TextField(
                controller: w,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Weight in Kg',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: TextField(
                controller: hfeet,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Height in Feet',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: TextField(
                controller: hinch,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Height in Inches',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: BMI_Calculation, child: Text('Measure')),
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
              r,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
