import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:service_repository/template_repository.dart';
import 'firebase_client.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user_repository/user_repository.dart';

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

  Future<Map<String, dynamic>> getService() async {
    var collection = FirebaseFirestore.instance.collection('Service');
    var querySnapshot = await collection.get();
    var queryDocumentSnapshot = querySnapshot.docs.first;
    Map<String, dynamic> data = queryDocumentSnapshot.data();
    return data;
  }

  @override
  Future setService(ServiceEntity service) async {
    FirebaseFirestore.instance.collection('Service').add({
      'gelis_tarihi': service.gelis_tarihi,
      "ownership": service.ownership,
      "bakim_asamasi": service.bakim_asamasi,
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

  Future<bool> checkUser(UserEntity user) async {
    var collection = FirebaseFirestore.instance.collection('User');
    var querySnapshot = await collection.get();
    var data = querySnapshot.docs.firstWhere(
      (element) => element.get('mail'),
    );
    var x = data.data().entries;
    print(x);
    return false;
  }

  Future setUser(UserEntity user) async {
    FirebaseFirestore.instance.collection('User').add({
      'mail': user.mail,
      "name": user.name,
      "ownership": user.ownership,
      "password": user.password,
    });
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
