
import 'package:injectable/injectable.dart';
import 'package:tut_app/features/auth/data/models/User.dart' show User;


@LazySingleton()
abstract class AuthRepository {
  Future<User?> signIn(String email, String password);

  Future<User?> signUp(String email, String password, String name);

  Future<void> logOut();
}
