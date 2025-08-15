import 'package:injectable/injectable.dart';
import 'package:tut_app/features/number_fact/data/models/NumberFact.dart';
import 'package:tut_app/features/number_fact/domain/usecases/BaseUseCase.dart';
import 'package:tut_app/features/number_fact/domain/repositories/NumberFactRepository.dart';

@injectable
class GetNumberFactUseCase extends BaseUseCase {
  NumberFactRepository numberFactRepository;
  GetNumberFactUseCase(this.numberFactRepository);

  @override
  Future<NumberFact> execute(int? number) {
    return numberFactRepository.getNumberFact(number!);
  }
}
