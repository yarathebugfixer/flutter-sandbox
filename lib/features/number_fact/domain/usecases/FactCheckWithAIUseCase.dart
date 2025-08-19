import 'package:firebase_ai/firebase_ai.dart';
import 'package:injectable/injectable.dart';
import 'package:tut_app/features/number_fact/data/models/NumberFact.dart';
import 'package:tut_app/features/number_fact/domain/usecases/BaseUseCase.dart';
import 'package:tut_app/features/number_fact/domain/repositories/NumberFactRepository.dart';

@injectable
class FactCheckWithAIUseCase extends BaseUseCase<GenerateContentResponse, NumberFact> {
  NumberFactRepository numberFactRepository;
  FactCheckWithAIUseCase(this.numberFactRepository);

  @override
  Future<GenerateContentResponse> execute([NumberFact? fact]) async {
    return  numberFactRepository.factCheckWithAI(fact!);
  }
}
