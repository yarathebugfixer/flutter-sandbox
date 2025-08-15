import 'package:injectable/injectable.dart';
import 'package:tut_app/features/auth/data/datasources/remote/FirebaseDataSource.dart';
import 'package:tut_app/features/auth/data/models/User.dart';
import 'package:tut_app/features/auth/domain/repositories/AuthRepository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final FirebaseDataSource _firebaseDataSource;

  AuthRepositoryImpl(this._firebaseDataSource);

  @override
  Future<User?> signIn(String email, String password) {
    return _firebaseDataSource.signIn(email, password);
  }

  @override
  Future<User?> signUp(String email, String password, String name) {
    return _firebaseDataSource.signUp(email, password, name);
  }

  @override
  Future<void> logOut() {
    return _firebaseDataSource.signOut();
  }
}
