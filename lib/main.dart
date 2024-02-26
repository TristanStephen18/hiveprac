import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hiveprac/boxes/boxes.dart';
import 'package:hiveprac/data/input.dart';
import 'package:hiveprac/screens/viewscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DatainputAdapter());
  datainputBox = await Hive.openBox('datainputBox');
  runApp(Homescreen());
}

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true
      ),
      home: Viewscreen(),
    );
  }
}