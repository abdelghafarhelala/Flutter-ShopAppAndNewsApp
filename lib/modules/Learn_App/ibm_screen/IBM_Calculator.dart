import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'Bmiresult.dart';


bool ismale = true;
double height = 180;
int weight = 70;
int age = 20;

class IBM extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<IBM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BMI Calculator")),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          ismale = true;
                        });
                      },
                      child: Container(
                        color: ismale ? Colors.blue : Colors.grey[400],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/male1.png'),
                              width: 90,
                              height: 90,
                            ),
                            Text(
                              "Male",
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          ismale = false;
                        });
                      },
                      child: Container(
                        color: ismale ? Colors.grey[400] : Colors.blue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/female.png'),
                              width: 90,
                              height: 90,
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Container(
                color: Colors.grey[400],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Height",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "cm",
                          style: TextStyle(fontSize: 25.0),
                        )
                      ],
                    ),
                    Slider(
                        value: height,
                        min: 80,
                        max: 220,
                        onChanged: (value) {
                          setState(() {
                            height = value;
                          });
                        })
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.grey[400],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weight",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "$weight",
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                child: Icon(Icons.remove),
                                heroTag: 'weight-',
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Icon(Icons.add),
                                heroTag: 'weight+',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.grey[400],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Age",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "$age",
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                child: Icon(Icons.remove),
                                heroTag: 'age-',
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                child: Icon(Icons.add),
                                heroTag: 'age+',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.blue,
            width: double.infinity,
            height: 60,
            child: MaterialButton(
              onPressed: () {
                setState(() {
                  double result = weight / pow(height / 100, 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Bmiresult(
                        age: age,
                        ismale: ismale,
                        result: result.round(),
                        weight: weight,
                      ),
                    ),
                  );
                });
              },
              child: Text("Calculate"),
            ),
          )
        ],
      ),
    );
  }
}
