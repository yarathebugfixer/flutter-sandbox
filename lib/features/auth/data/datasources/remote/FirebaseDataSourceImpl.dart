import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:tut_app/features/auth/data/datasources/remote/FirebaseDataSource.dart';
import 'package:tut_app/features/auth/data/models/User.dart' as UserModel;

@LazySingleton(as: FirebaseDataSource)
class FirebaseDataSourceImpl extends FirebaseDataSource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  FirebaseDataSourceImpl(this._auth, this._firestore);

  Future<User?> signIn(String email, String password) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential.user;
  }

  Future<User?> signUp(String email, String password, String name) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCredential.user;

    if (user != null) {
      await _firestore.collection('users').doc(user.uid).set({
        'display_name': name,
        'email': email,
        'createdAt': DateTime.now(),
      });
    }
    return user;
  }

  Future<void> logOut() async {
    _auth.signOut();

  }

  @override
  Future<UserModel.User?> getUserByEmail(String email) async {
    final querySnapshot = await _firestore
        .collection("users")
        .where("email", isEqualTo: email)
        .limit(1)
        .get();

    if (querySnapshot.docs.isEmpty) {
      return null;
    }

    final doc = querySnapshot.docs.first;
    final data = doc.data();

    return UserModel.User(
      id: doc.id,
      username: data['name'],
      email: data['email'],
    );
  }

  @override
  UserModel.User? getCurrentUser() {
    var fireBaseUser = _auth.currentUser;
    if (fireBaseUser != null) {
      return UserModel.User(
        id: fireBaseUser.uid,
        email: fireBaseUser.email,
        username: fireBaseUser.displayName,
      );
    }

    return null;
  }
}
