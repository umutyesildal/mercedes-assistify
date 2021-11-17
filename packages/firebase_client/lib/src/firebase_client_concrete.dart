import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'firebase_client.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseClientConcrete extends FirebaseClient {
  Future init() async {
    await Firebase.initializeApp();
    //FirebaseFirestore instance = FirebaseFirestore.instance;
  }

  Future<Map<String, dynamic>> getCar() async {
      var collection = FirebaseFirestore.instance.collection('Car');
      var querySnapshot = await collection.get();
      var queryDocumentSnapshot = querySnapshot.docs.first;
      Map<String, dynamic> data = queryDocumentSnapshot.data();
      print(data);
      return data;
  }

  Future setCar() async{
    FirebaseFirestore.instance
                .collection('Car')
                .doc("deneme")
                .set({'text': 'afsdfs'});
  }

  @override
  void close() {}
}
