import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_todo/screens/home_screen.dart';

import 'model/note.dart';


void main() async {

  //initilizing the  Hive
  await Hive.initFlutter();
  //registering the  typeAdapter
  Hive.registerAdapter(NoteAdapter());
  //opening the  Box
  await Hive.openBox('noteBox');

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    // close all hive Boxes
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home:HomeScreen(),
    );
  }
}