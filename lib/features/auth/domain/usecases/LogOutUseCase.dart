import 'package:injectable/injectable.dart';
import 'package:tut_app/features/auth/domain/repositories/AuthRepository.dart';

@injectable
class LogOutUseCase {
  final AuthRepository _repository;

  LogOutUseCase(this._repository);

  Future<void> call() {
    return _repository.logOut();
  }
}
