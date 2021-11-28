import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:service_repository/template_repository.dart';
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
    return data;
  }

  Future setCar() async {
    FirebaseFirestore.instance
        .collection('Car')
        .doc("deneme")
        .set({'text': 'afsdfs'});
  }

  @override
  Future setService(ServiceEntity service) async {
    FirebaseFirestore.instance.collection('Service').add({
      'gelis_tarihi': service.gelis_tarihi,
      "maintenance": service.maintenance,
      "ownership": service.ownership,
      "teslim_tarihi": service.teslim_tarihi
    });
  }

  Future<Map<String, dynamic>> getUser() async {
    var collection = FirebaseFirestore.instance.collection('User');
    var querySnapshot = await collection.get();
    var queryDocumentSnapshot = querySnapshot.docs.first;
    Map<String, dynamic> data = queryDocumentSnapshot.data();
    print(data);
    return data;
  }

  Future<Map<String, dynamic>> getOwnership() async {
    var collection = FirebaseFirestore.instance.collection('Ownership');
    var querySnapshot = await collection.get();
    var queryDocumentSnapshot = querySnapshot.docs.first;
    Map<String, dynamic> data = queryDocumentSnapshot.data();
    print(data);
    return data;
  }

  Future<Map<String, dynamic>> getMaintenance() async {
    var collection = FirebaseFirestore.instance.collection('Maintanence');
    var querySnapshot = await collection.get();
    var queryDocumentSnapshot = querySnapshot.docs.first;
    Map<String, dynamic> data = queryDocumentSnapshot.data();
    print(data);
    return data;
  }

  @override
  void close() {}
}
