import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'firebase_client.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseClientConcrete extends FirebaseClient {
  Future init() async {
    await Firebase.initializeApp();
    FirebaseFirestore.instance
                .collection('Car')
                .add({'text': 'afsdfs'});
  }

  @override
  Future getCar() async {}

  @override
  void close() {}
}
