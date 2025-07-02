import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? phoneNumber = FirebaseAuth.instance.currentUser?.phoneNumber;

  Future<void> saveData(String name, int age) async {
    try {
      final user = _auth.currentUser;
      if (user == null) throw Exception('user not logged in');

      await _firestore.collection('usersList').doc(phoneNumber).set({
        'name': name,
        'Age': age,
      }, SetOptions(merge: true));
      notifyListeners();
    } catch (error) {
      notifyListeners();
      rethrow;
    }
  }
}
