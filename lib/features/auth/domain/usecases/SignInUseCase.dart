
import 'package:injectable/injectable.dart';
import 'package:tut_app/features/auth/data/models/User.dart';
import 'package:tut_app/features/auth/domain/repositories/AuthRepository.dart';

@injectable
class SignInUseCase {
  final AuthRepository _repository;

  SignInUseCase(this._repository);

  Future<User?> call(String email, String password) {
    return _repository.signIn(email, password);
  }
}
