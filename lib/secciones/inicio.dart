import 'package:flutter/material.dart';
import 'package:ejerciciopractico/secciones/paginas.dart';

class inicio extends StatefulWidget {
  inicio({Key ?key}) : super(key: key);

  @override
  _inicioState createState() {
    return _inicioState();
  }
}

class _inicioState extends State<inicio> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: paginas(),
    );
  }
}