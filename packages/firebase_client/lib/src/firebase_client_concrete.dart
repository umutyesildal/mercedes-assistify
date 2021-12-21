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

  Future<bool> checkAuth(UserEntity user) async {
    bool exist = await checkUser(user);
    if (exist) {
      var doc = await FirebaseFirestore.instance
          .collection('User')
          .doc(user.mail)
          .get();
      Map<String, dynamic>? data = doc.data();
      print(data);
      var mail = data?['mail'];
      var password = data?['password'];
      if (mail == user.mail && password == user.password) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<bool> checkOwnership(UserEntity user) async {
    var doc = await FirebaseFirestore.instance
        .collection('User')
        .doc(user.mail)
        .get();
    Map<String, dynamic>? data = doc.data();
    print(data);
    var ownership = data?['ownership'];
    if (ownership == '') {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> addOwnership(UserEntity user) async {
    bool isAdded = false;
    await FirebaseFirestore.instance
        .collection('User')
        .doc(user.mail)
        .update({'ownership': user.ownership}).onError(
            (error, stackTrace) => isAdded = true);

    return isAdded;
  }

  Future<bool> checkUser(UserEntity user) async {
    bool exist = false;
    try {
      await FirebaseFirestore.instance
          .collection('User')
          .doc(user.mail)
          .get()
          .then((doc) {
        exist = doc.exists;
      });
      return exist;
    } catch (e) {
      return false;
    }
  }

  Future setUser(UserEntity user) async {
    FirebaseFirestore.instance.collection('User').doc(user.mail).set({
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
