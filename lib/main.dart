import 'package:employee/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyB5q-pg4SkNM55iMojwn5NJkl0kB0rPImg",
      appId: "1:494987713939:web:f5b2c050360d419f905c66",
      messagingSenderId: "494987713939",
      projectId: "employee-a5b8b",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Employees',
      debugShowCheckedModeBanner: false,
      home: EmployeeList(),
    );
  }
}

