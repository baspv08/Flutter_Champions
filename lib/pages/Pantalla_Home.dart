import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_champions/pages/Pantalla_Agregar_Jugador.dart';
import 'package:flutter_champions/services/firestore_service.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Pantalla_Home extends StatefulWidget {
  const Pantalla_Home({super.key});

  @override
  State<Pantalla_Home> createState() => _Pantalla_HomeState();
}

class _Pantalla_HomeState extends State<Pantalla_Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Champions League'),
        leading: Icon(MdiIcons.soccer, color: Colors.white,),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: StreamBuilder(
          stream: FirestoreService().Jugadores(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting){
            //esperando datos
            return Center(child: CircularProgressIndicator());
          }else{
            //datos llegaron, mostrar en pagina
            return ListView.separated(
              separatorBuilder: (context, index) => Divider(),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index){
                var jugadores = snapshot.data!.docs[index];
                return ListTile(
                  leading: Icon(MdiIcons.account),
                  title: Text('${jugadores['Nombre']} ${jugadores['Apellido']} (${jugadores['Edad']})'),
                  subtitle: Text('${jugadores['Equipo']}'),
                  
                );
              },
            );
          }
          },
        ),
      ),
      floatingActionButton:  FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        MaterialPageRoute route =
          MaterialPageRoute(builder: (context) => Pantalla_Agregar_Jugador());
          Navigator.push(context, route);
      },
      ),
    );
  }
}
