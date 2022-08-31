import 'package:cloud_firestore/cloud_firestore.dart';

class MyDatabase {
    getData() {
      return FirebaseFirestore.instance.collection('Employees').doc().get();
    }

}