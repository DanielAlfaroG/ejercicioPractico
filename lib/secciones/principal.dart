import 'package:flutter/material.dart';
import 'package:ejerciciopractico/secciones/inicio.dart';

class ejerciciopractico extends StatelessWidget {
  ejerciciopractico({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Animals",
      home: inicio(),
    );
  }
}
