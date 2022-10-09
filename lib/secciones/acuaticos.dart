import 'package:ejerciciopractico/temas/default.dart';
import 'package:flutter/material.dart';
import 'package:ejerciciopractico/json/datos.dart';
import 'package:ejerciciopractico/secciones/descripcion1.dart';
import 'package:page_transition/page_transition.dart';

class acuaticos extends StatefulWidget {
  acuaticos({Key ?key}) : super(key: key);

  @override
  State<acuaticos> createState() => _acuaticosState();
}

class _acuaticosState extends State<acuaticos> {
  int menu_activo = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 140, left: 20, right: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            //Imagen portada
            SizedBox(
              height: 240,
              child: Container(
                decoration: const BoxDecoration(
                  color: primario,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(image: AssetImage("assets/imagenes/acuaticos/banner.jpg"), fit: BoxFit.cover),
                ),
              ),
            ),

            const SizedBox(height: 25),

            const Text("Animales acuaticos", style: TextStyle(
              color: terciario,
              fontWeight: FontWeight.bold,
              fontSize: 18
            )),
            
            const SizedBox(height: 20),
            
            //Listado de animales:
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(datoacuaticos.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: GestureDetector(
                      //Parte logica
                      onTap: () {
                        Navigator.push(context, PageTransition(
                            alignment: Alignment.bottomCenter,
                            child: descripcion1(
                              datos: datoacuaticos[index]
                            ),
                            type: PageTransitionType.bottomToTop
                        ));
                      },

                      //Parte de diseño
                      child: Column(
                        children: [
                          Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              image: DecorationImage(image: AssetImage(datoacuaticos[index]['imagen']),
                              fit: BoxFit.cover))
                          ),

                          const SizedBox(height: 15),

                          Text(datoacuaticos[index]['nombre comun'], style: const TextStyle(
                            color: terciario,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          )),

                          Text(datoacuaticos[index]['nombre cientifico'], style: const TextStyle(
                            color: Colors.white,
                          ))
                        ],
                      ),

                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}