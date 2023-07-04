import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// import 'package:notes_app/register/register.dart';

// import 'login/login.dart';
import 'package:notes_app/login/login.dart';
// import 'notes/notes.dart';
// import 'register/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
      home: Login(),
    );
  }
}
