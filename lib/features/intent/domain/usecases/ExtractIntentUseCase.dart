import 'package:injectable/injectable.dart';
import 'package:tut_app/features/intent/data/models/UserIntent.dart';
import 'package:tut_app/features/number_fact/domain/usecases/BaseUseCase.dart';
import 'package:tut_app/features/intent/domain/repositories/IntentRepository.dart';

@injectable
class ExtractIntentUseCase extends StreamUseCase<UserIntent, void> {
  IntentRepository intentRepository;
  ExtractIntentUseCase(this.intentRepository);

  @override
  Stream<UserIntent> execute([void params])  {
    return intentRepository.listen();
  }

  Future<void> stop() => intentRepository.stopListening();
}
