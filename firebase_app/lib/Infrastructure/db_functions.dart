import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/Core/core.dart';
import 'package:firebase_app/Model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<bool> addUser(UserModel u) async {
  final UserCredential userCredential = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(
        email: u.userEmail,
        password: u.userPassword,
      );
  try {
    if (userCredential != null) {
      final fireBaseInstance = await FirebaseFirestore.instance
          .collection("users")
          .doc(userCredential.user!.uid)
          .set({
            'user_name': u.userName,
            'user_email': u.userEmail,
            'user_gender': u.userGender,
            'user_address': u.userAddress,
          });
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  } catch (e) {
    return Future.value(false);
  }
}

Future<bool> checkLogin(UserModel u) async {
  try {
    final UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: u.userEmail,
          password: u.userPassword,
        );
    currentUserId = userCredential.user!.uid;
    return Future.value(true);
  } catch (e) {
    return Future.value(false);
  }
}

Future<UserModel> loadUser(String userID) async {
  final fireBaseInstance = await FirebaseFirestore.instance
      .collection("users")
      .doc(currentUserId)
      .get();
  final userData = fireBaseInstance.data();
  UserModel u = UserModel(
    "",
    userData!['user_name'],
    userData['user_email'],
    userData["user_gender"],
    userData['user_address'],
    "",
  );
  return Future.value(u);
}

Future<bool> editUser(UserModel u) async {
  try {
    final fireBaseInstance = await FirebaseFirestore.instance
        .collection("users")
        .doc(currentUserId)
        .set({
          'user_name': u.userName,
          'user_email': u.userEmail,
          'user_gender': u.userGender,
          'user_address': u.userAddress,
        });
    return Future.value(true);
  } catch (e) {
    return Future.value(false);
  }
}
