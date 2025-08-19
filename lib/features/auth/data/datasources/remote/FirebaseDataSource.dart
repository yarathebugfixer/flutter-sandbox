import 'package:firebase_auth/firebase_auth.dart';
import 'package:tut_app/features/auth/data/models/User.dart' as UserModel;

abstract class FirebaseDataSource {
  Future<User?> signIn(String email, String password);
  Future<User?> signUp(String email, String password, String name);
  Future<void> logOut();
  Future<UserModel.User?> getUserByEmail(String email);
  UserModel.User? getCurrentUser();
}
