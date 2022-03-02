import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:football_app/Controlller/authcontroller.dart';
import 'package:football_app/Model/user.dart';
import 'package:get/get.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String? userId = Get.find<AuthController>().currentUser!.uid;
  UserCredential? userCredential;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore
          .collection("users")
          .doc(user.id)
          .collection("userDetails")
          .doc("userDetails")
          .set({
        "name": user.name,
        "email": user.email,
        "photoUrl": user.photoUrl,
        "createdAt":
            userCredential!.user!.metadata.creationTime!.toIso8601String(),
        "chat": user.chat,
      });
      return true;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return false;
    }
  }

  Future<void> updateProfilePic(photoUrl) async {
    await _firestore
        .collection("users")
        .doc(userId)
        .collection('userDetials')
        .doc('userDetials')
        .update({"photoUrl": photoUrl});
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection("users").doc(uid).get();
      return UserModel.fromDocumentSnapshot(_doc);
    } catch (e) {
      // ignore: avoid_print
      print(e);
      rethrow;
    }
  }
}
