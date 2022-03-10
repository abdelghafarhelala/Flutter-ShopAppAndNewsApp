import 'package:flutter/material.dart';

class Bmiresult extends StatelessWidget {
  bool ismale;
  int result;
  int age;
  int weight;
  Bmiresult({
    this.age,
    this.ismale,
    this.result,
    this.weight,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Result"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Gender :${ismale ? 'male' : 'female'}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
            Text(
              "Result :$result",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
            Text(
              "age :$age",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
            Text(
              "weight :$weight",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
