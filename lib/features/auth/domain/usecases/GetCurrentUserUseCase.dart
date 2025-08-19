import 'package:injectable/injectable.dart';
import 'package:tut_app/features/auth/data/models/User.dart';
import 'package:tut_app/features/auth/domain/repositories/AuthRepository.dart';

@injectable
class GetCurrentUserUseCase {
  final AuthRepository _repository;

  GetCurrentUserUseCase(this._repository);

  User? call() {
    return _repository.getCurrentUser();
  }
}
