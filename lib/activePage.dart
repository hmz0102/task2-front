import 'package:flutter/material.dart';

class Activepage extends StatefulWidget {
  const Activepage({super.key});

  @override
  State<Activepage> createState() => _ActivepageState();
}

class _ActivepageState extends State<Activepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Activity Page")),
      body: Center(child: Text("Activity Page")),
    );
  }
}
