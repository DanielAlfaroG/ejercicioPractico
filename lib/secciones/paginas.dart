import 'package:ejerciciopractico/temas/default.dart';
import 'package:flutter/material.dart';
import 'Home.dart';

class paginas extends StatefulWidget {
  paginas({Key ?key}) : super(key: key);

  @override
  _paginasState createState() {
    return _paginasState();
  }
}

class _paginasState extends State<paginas> {
  int menu_activo = 0;
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
      backgroundColor: fondo,
      bottomNavigationBar: Footer(),
      body: Home(),
    );
  }

  //Barra inferior
  Widget Footer() {
    List items = [
      Icons.home,
      Icons.search,
      Icons.favorite,
      Icons.person,
    ];

    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: primario,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                return IconButton(
                  onPressed: () {

                  },
                  icon: Icon(
                      items[index],
                      size: 32,
                      //color: const Color.fromRGBO(90, 90, 90, 100),
                      color: menu_activo == index ? terciario : secundario
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );

  }

}