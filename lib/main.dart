import 'package:connect_four/core/bindings/main_bindings.dart';
import 'package:connect_four/screens/game_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//import 'package:get/get.dart'
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MainBindings(),
      title: 'Connect Four!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: GameScreen(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => GameScreen()),
      ],
    );
  }
}
