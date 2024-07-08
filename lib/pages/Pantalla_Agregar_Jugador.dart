import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Pantalla_Agregar_Jugador extends StatefulWidget {
  const Pantalla_Agregar_Jugador({super.key});

  @override
  State<Pantalla_Agregar_Jugador> createState() => _Pantalla_Agregar_JugadorState();
}

class _Pantalla_Agregar_JugadorState extends State<Pantalla_Agregar_Jugador> {
  TextEditingController nombreCtrl = TextEditingController();
  TextEditingController apellidoCtrl = TextEditingController();
  TextEditingController edadCtrl = TextEditingController();

  final formkey = GlobalKey<FormState>();
  DateTime fecha_de_nacimiento = DateTime.now();
  final formatofecha = DateFormat('dd-MM-yyyy');
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Jugadores', style: TextStyle(color: Colors.white)),
      ),
      body: Form(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: [
            //NOMBRE
            TextFormField(
              controller: nombreCtrl,
              decoration: InputDecoration(
                label: Text('Nombre'),
              ),
              validator: (nombre){
                if(nombre!.isEmpty){
                  return 'Indique el nombre del Jugador';
                }
                if(nombre.length <2){
                  return 'El nombre debe tener al menos 3 caracteres';
                }
                return null;
              },
            ),
            //APELLIDO
            TextFormField(
              controller: apellidoCtrl,
              decoration: InputDecoration(
                label: Text('Apellido'),
              ),
              validator: (apellido){
                if(apellido!.isEmpty){
                  return 'Indique el apellido del Jugador';
                }
                if(apellido.length <2){
                  return 'El apellido debe tener al menos 3 caracteres';
                }
                return null;
              },
            ),
            //EDAD
            TextFormField(
              controller: edadCtrl,
              decoration: InputDecoration(
                label: Text('Edad'),
              ),
              validator: (edad){
                if(edad!.isEmpty){
                  return 'Indique la edad del Jugador';
                }
                if (int.tryParse(edad) == null){
                  return 'La edad debe ser un numero';
                }
                if(int.parse(edad)<0){
                  return 'La edad debe ser un numero positivo';
                }
                return null;
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Text('Fecha De Nacimiento: '),
                  Text(formatofecha.format(fecha_de_nacimiento).toString(), style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Spacer(),
                  IconButton(
                    icon: Icon(MdiIcons.calendar),
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate:  DateTime.now(),
                        firstDate: DateTime(1000),
                        lastDate: DateTime.now()
                      ).then((fecha){
                        setState(() {
                          fecha_de_nacimiento = fecha ?? fecha_de_nacimiento;
                        });
                      });
                    },
                  )
                ],
              ),
            ),
            //BOTON
            Container(
              margin: EdgeInsets.only(top: 30),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text('Agregar Jugador', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  if(formkey.currentState!.validate()) {


                    Navigator.pop(context);
                  }
                },
              ),
            ),
            ]
          ),
        ),
      ),
    );
  }
}