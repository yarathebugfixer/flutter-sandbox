import 'package:injectable/injectable.dart';
import 'package:tut_app/features/auth/data/datasources/remote/FirebaseDataSource.dart';
import 'package:tut_app/features/auth/data/models/User.dart' as UserModel;
import 'package:tut_app/features/auth/domain/repositories/AuthRepository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final FirebaseDataSource _firebaseDataSource;

  AuthRepositoryImpl(this._firebaseDataSource);

  @override
  Future<UserModel.User?> signIn(String email, String password) async {
    var fireBaseUser = await _firebaseDataSource.signIn(email, password);
    if (fireBaseUser == null) return null;

    return UserModel.User(
      id: fireBaseUser.uid,
      email: fireBaseUser.email,
      username: fireBaseUser.displayName,
    );
  }

  @override
  Future<UserModel.User?> signUp(String email, String password, String username) async {
    var fireBaseUser = await _firebaseDataSource.signUp(
      email,
      password,
      username,
    );

    if (fireBaseUser == null) return null;
    return UserModel.User(
      id: fireBaseUser.uid,
      email: fireBaseUser.email,
      username: fireBaseUser.displayName,
    );
  }

  @override
  Future<void> logOut() {
    return _firebaseDataSource.logOut();
  }

  @override
  UserModel.User? getCurrentUser() {
    return _firebaseDataSource.getCurrentUser();
  }
}
