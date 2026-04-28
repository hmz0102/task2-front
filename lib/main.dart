import 'package:etrain/firebase_options.dart';
import 'package:etrain/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:etrain/pages/loginPage.dart'; // تأكد من اسم الملف

void main() async {
  // هاي الخطوة ضرورية عشان تتأكد إن الـ Widgets جاهزة قبل التهيئة
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // الـ MaterialApp يجب أن تغلف كل شيء
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser != null
          ? const Homepage()
          : const Loginpage(),
    );
  }
}
