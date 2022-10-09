import 'package:ejerciciopractico/temas/default.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';



class descripcion1 extends StatefulWidget {
  const descripcion1({Key? key, this.datos}) : super (key: key);
  final dynamic datos;

  @override
  State<descripcion1> createState() => _descripcion1State();
}

class _descripcion1State extends State<descripcion1> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: fondo,
      body: cuerpo(),
      bottomNavigationBar: barraReproduccion(),
    );
  }
  
  Widget barraReproduccion() {
    var soundfile = widget.datos['sonido'];
    final player = AudioPlayer();
    player.setVolume(1.0);
    var auxiliar = false;

    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: primario,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.music_note, color: terciario, size: 40),

              Padding(
                padding: const EdgeInsets.only(top: 8, left: 5, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Sonido de", style: TextStyle(
                      color: terciario,
                      fontSize: 20
                    )),
                    Text(widget.datos['nombre comun'], style: const TextStyle(
                      color: Colors.white
                    ),)
                  ],
                ),
              ),

              //Reproduccion de audio
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: secundario,
                  borderRadius: BorderRadius.circular(100)
                ),
                child: IconButton(
                  icon: const Icon(Icons.play_arrow, color: terciario),
                  //Area logica de reproduccion
                  onPressed: () async {
                    auxiliar = true;
                    await player.setSource(AssetSource(soundfile));
                    await player.resume();
                  },
                )
              ),

              //Boton de Stop
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: IconButton(
                  enableFeedback: auxiliar,
                  icon: const Icon(Icons.stop, color: terciario, size: 25),
                  onPressed: () async {
                    await player.stop();
                  },
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Icon(Icons.repeat, color: terciario, size: 25),
              ),


            ],
          )
        ],
      ),
    );
  }

  Widget cuerpo() {
    return SingleChildScrollView(
      child: Column(
        children: [
          //Barra superior
          Container(
              decoration: const BoxDecoration(
                  color: primario,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: () {
                            Navigator.pop(context);
                          }, icon: const Icon(Icons.arrow_back_ios, color: terciario, size: 35)),
                          Text(widget.datos['nombre comun'], style: const TextStyle(
                              fontSize: 40,
                              color: terciario,
                              fontWeight: FontWeight.bold
                          ),),
                          IconButton(onPressed: () {
                            //Navigator.pop(context);
                          }, icon: const Icon(Icons.menu , color: terciario, size: 35)),
                        ]
                    ),

                    Text(widget.datos['nombre cientifico'], style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),),

                    const SizedBox(height: 20)
                  ],
                ),
              )
          ),

          //Cuerpo general
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(image: AssetImage(widget.datos['imagen']), fit: BoxFit.cover)
                  ),
                ),

                const SizedBox(height: 20),

                //Grupo datos 1
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        //Icono:
                        Container(
                          height: 45,
                          width: 45,
                          decoration: const BoxDecoration(
                            color: secundario,
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                          ),
                          child: const Icon(Icons.male, color: terciario,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Titulo
                              const SizedBox(
                                width: 150,
                                child: Text("Longitud del macho", style: TextStyle(
                                  color: terciario,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                                )),
                              ),

                              //Dato
                              Text(widget.datos['longitud macho'], style: const TextStyle(
                                color: Colors.white
                              ),)
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        //Icono:
                        Container(
                          height: 45,
                          width: 45,
                          decoration: const BoxDecoration(
                            color: secundario,
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                          ),
                          child: const Icon(Icons.female, color: terciario,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Titulo
                              const SizedBox(
                                width: 150,
                                child: Text("Longitud de la hembra", style: TextStyle(
                                    color: terciario,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                )),
                              ),

                              //Dato
                              Text(widget.datos['longitud hembra'], style: const TextStyle(
                                  color: Colors.white
                              ),)
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                //Bloque de datos 2:
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        //Icono:
                        Container(
                          height: 45,
                          width: 45,
                          decoration: const BoxDecoration(
                            color: secundario,
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                          ),
                          child: const Icon(Icons.food_bank, color: terciario,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Titulo
                              const SizedBox(
                                width: 150,
                                child: Text("Alimentacion", style: TextStyle(
                                    color: terciario,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                )),
                              ),

                              //Dato
                              SizedBox(
                                width: 150,
                                child: Text(widget.datos['Alimentacion'], style: const TextStyle(
                                    color: Colors.white
                                ),),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        //Icono:
                        Container(
                          height: 45,
                          width: 45,
                          decoration: const BoxDecoration(
                            color: secundario,
                            borderRadius: const BorderRadius.all(Radius.circular(100)),
                          ),
                          child: const Icon(Icons.map , color: terciario,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 7),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Titulo
                              const SizedBox(
                                width: 150,
                                child: Text("Conservacion", style: TextStyle(
                                    color: terciario,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18
                                )),
                              ),

                              //Dato
                              SizedBox(
                                width: 150,
                                child: Text(widget.datos['Conservacion'], style: const TextStyle(
                                    color: Colors.white
                                ),),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                //Descripcion:
                Text(widget.datos['Descripcion'], textAlign: TextAlign.justify, style: const TextStyle(
                  color: terciario
                ),)

              ],
            ),
          ),
        ],
      ),
    );
  }
}