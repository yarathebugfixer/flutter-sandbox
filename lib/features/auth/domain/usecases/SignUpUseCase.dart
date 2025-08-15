

import 'package:injectable/injectable.dart';
import 'package:tut_app/features/auth/data/models/User.dart';
import 'package:tut_app/features/auth/domain/repositories/AuthRepository.dart';

@injectable
class SignUpUseCase {
  final AuthRepository _repository;

  SignUpUseCase(this._repository);

  Future<User?> call(String email, String password, String name) {
    return _repository.signUp(email, password, name);
  }
}
