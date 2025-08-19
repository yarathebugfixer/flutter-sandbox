
import 'package:tut_app/features/auth/data/models/User.dart' as UserModel;

abstract class AuthRepository {
  Future<UserModel.User?> signIn(String email, String password);

  Future<UserModel.User?> signUp(String email, String password, String username);

  Future<void> logOut();

  UserModel.User? getCurrentUser();

}
