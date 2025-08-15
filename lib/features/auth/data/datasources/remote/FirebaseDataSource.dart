
import 'package:tut_app/features/auth/data/models/User.dart';

abstract class FirebaseDataSource {
  Future<User?> signIn(String email, String password);
  Future<User?> signUp(String email, String password, String name);
  Future<void> signOut();
}
