import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:tut_app/features/auth/data/datasources/remote/FirebaseDataSource.dart';

@LazySingleton(as: FirebaseDataSource)
class FirebaseDataSourceImpl {
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
        'name': name,
        'email': email,
        'createdAt': DateTime.now(),
      });
    }
    return user;
  }

  Future<void> signOut() async => _auth.signOut();
}
