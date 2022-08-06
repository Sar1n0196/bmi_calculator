// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use, avoid_unnecessary_containers, unnecessary_const

import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: const BMICal(),
    );
  }
}

class BMICal extends StatefulWidget {
  const BMICal({Key? key}) : super(key: key);

  @override
  State<BMICal> createState() => _BMICalState();
}

class _BMICalState extends State<BMICal> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 16, 16, 16),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: GradientText(
          'BMI Calculator',
          style: const TextStyle(
            fontSize: 50.0,
          ),
          gradientType: GradientType.radial,
          gradientDirection: GradientDirection.ttb,
          radius: 5,
          colors: [
            const Color.fromARGB(255, 255, 0, 140),
            const Color.fromARGB(255, 85, 17, 181),
          ],
        ),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  radioButton("Male", Colors.blueAccent, 1),
                  radioButton("Female", Colors.pinkAccent, 0)
                ],
              ),
              SizedBox(
                height: 23,
              ),
              Text(
                "Height",
                style: TextStyle(
                    color: Color.fromARGB(255, 152, 152, 152), fontSize: 21),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(                
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: "Your Height in cm",
                    filled: true,
                    fillColor: Color.fromARGB(255, 30, 30, 30),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: BorderSide.none)),
              ),
              SizedBox(
                height: 23,
              ),
              Text(
                "Weight",
                style: TextStyle(
                    color: Color.fromARGB(255, 152, 152, 152), fontSize: 21),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    hintText: "Your Weight in kg",
                    filled: true,
                    fillColor: Color.fromARGB(255, 30, 30, 30),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(13),
                        borderSide: BorderSide.none)),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                child: FlatButton(
                  height: 50,
                  onPressed: () {},
                  color: Color.fromARGB(255, 187, 134, 252),                  
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 30, 30, 30),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Text(
                "Your BMI is: ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 152, 152, 152)),
              )
            ],
          ),
        ),
      ),
    ));
  }

  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        height: 80,
        child: FlatButton(
            color:
                currentindex == index ? color : Color.fromARGB(255, 30, 30, 30),
            onPressed: () {
              changeIndex(index);
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            child: Text(
              value,
              style: TextStyle(
                  color: currentindex == index ? Colors.white : color,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )),
      ),
    );
  }
}
