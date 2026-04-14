// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

void main() {
  runApp(MyApp());
}

class _MyAppState extends State<MyApp> {
  String display = "0";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text("Simple calculator"),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 10, left: 10),
                alignment: Alignment.bottomLeft,
                height: 150,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    display,
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(20),
                height: 600,
                width: 500,
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        button("7", Colors.white, 70),
                        button("8", Colors.white, 70),
                        button("9", Colors.white, 70),
                        button("/", Colors.orange, 70),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        button("4", Colors.white, 70),
                        button("5", Colors.white, 70),
                        button("6", Colors.white, 70),
                        button("*", Colors.orange, 70),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        button("1", Colors.white, 70),
                        button("2", Colors.white, 70),
                        button("3", Colors.white, 70),
                        button("-", Colors.orange, 70),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        button(".", Colors.white, 70),
                        button("0", Colors.white, 70),
                        button("=", Colors.orange, 70),
                        button("+", Colors.orange, 70),
                      ],
                    ),
                    SizedBox(height: 30),
                    button("Clear", Colors.red, 350),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget button(String text, Color color, double size) {
    return MaterialButton(
      elevation: 5.0,
      onPressed: () {
        if (text == "=") {
          setState(() {
            calculateResult();
          });
        } else if (text == "Clear") {
          setState(() {
            display = "0";
          });
        } else if (display == "0") {
          setState(() {
            display = text;
          });
        } else {
          setState(() {
            display += text;
          });
        }
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: color,
      height: 70,
      minWidth: size,
      child: Text(text, style: TextStyle(fontSize: 25, color: Colors.black)),
    );
  }

  void calculateResult() {
    // using the math Expression to solve it in the shortest way
    try {
      Parser p = Parser();

      Expression exp = p.parse(display);

      ContextModel cm = ContextModel();

      double eval = exp.evaluate(EvaluationType.REAL, cm);

      setState(() {
        display = eval.toString();
      });
    } catch (e) {
      setState(() {
        display = "Error";
      });
    }
  }
}
