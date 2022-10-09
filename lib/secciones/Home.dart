import 'package:ejerciciopractico/secciones/terrestres.dart';
import 'package:ejerciciopractico/temas/default.dart';
import 'package:flutter/material.dart';
import 'package:ejerciciopractico/secciones/acuaticos.dart';
import 'package:page_transition/page_transition.dart';

import 'felinos.dart';

class Home extends StatefulWidget {
  Home({Key ?key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int menu_activo = 0;
  List categorias = [
    "acuaticos",
    "felinos",
    "terrestres"
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        // Barra superior
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 25, left: 20),
              child: Text("WikiAnimals", style: TextStyle(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.bold
              ),),
            ),

            const SizedBox(height: 25),

            //Menu superior
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(categorias.length, (index) {
                  return GestureDetector(
                    //Gestion logica
                    onTap: () {
                      setState(() {
                        menu_activo = index;
                      });
                    },

                    //Gestion grafica
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        menu_activo == index ? Container(
                          height: 29,
                          width: 120,
                          decoration: BoxDecoration(
                              color: secundario,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              categorias[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ):SizedBox(
                          height: 29,
                          width: 120,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Text(
                              categorias[index],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                  );
                }),
              ),
            )

          ],
        ),
        IndexedStack(
          index: menu_activo, children: [

          acuaticos(),

          felinos(),

          terrestres()
        ],
        )
      ],
    );

  }
}