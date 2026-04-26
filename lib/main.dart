import 'package:flutter/material.dart';
import 'package:etrain/pages/loginPage.dart'; // تأكد من اسم الملف

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // الـ MaterialApp يجب أن تغلف كل شيء
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Loginpage(), // هنا ننادي صفحة اللوجن
    );
  }
}
