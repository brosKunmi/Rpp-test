import 'package:flutter/material.dart';
import 'package:pic_app/pages/home_page.dart';
import 'package:pic_app/services/repo/pic_service.dart';

void main() {
  //? temp to determine json response of the endpoint
  PicsService().getModel();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
