import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  //obtener lista de jugadores
  Stream<QuerySnapshot> Jugadores(){
    return FirebaseFirestore.instance.collection('Jugadores').snapshots();
  }
}