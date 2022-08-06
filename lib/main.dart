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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: GradientText(
          'BMI Calculator',
          style: const TextStyle(
            fontSize: 50.0,
          ),
          gradientType: GradientType.linear,
          gradientDirection: GradientDirection.ltr,
          colors: [
            const Color.fromARGB(255, 255, 0, 140),
            const Color.fromARGB(255, 85, 17, 181),
          ],
        ),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                radioButton("Male", Colors.blueAccent, 1),
                radioButton("Female", Colors.pinkAccent, 0)
              ],
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
        child: FlatButton(
            color: currentindex == index ? color : Colors.grey,
            onPressed: () {
              changeIndex(index);
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            child: Text(value, style: TextStyle(
              color: currentindex == index ? Colors.white : color,
            ),)),
      ),
    );
  }
}
