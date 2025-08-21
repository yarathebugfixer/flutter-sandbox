import 'package:injectable/injectable.dart';
import 'package:tut_app/features/intent/data/models/UserIntent.dart';
import 'package:tut_app/features/number_fact/domain/usecases/BaseUseCase.dart';
import 'package:tut_app/features/intent/domain/repositories/IntentRepository.dart';

@injectable
class ExtractIntentUseCase extends BaseUseCase<UserIntent, void> {
  IntentRepository intentRepository;
  ExtractIntentUseCase(this.intentRepository);

  @override
  Future<UserIntent> execute([void params]) async {
    return await intentRepository.listen();
  }

  Future<void> stop() => intentRepository.stopListening();
}
