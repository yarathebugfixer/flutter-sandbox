import 'package:injectable/injectable.dart';
import 'package:tut_app/features/intent/data/datasources/local/ai/IntentDataSource.dart';
import 'package:tut_app/features/intent/data/models/UserIntent.dart';
import 'package:tut_app/features/intent/domain/repositories/IntentRepository.dart';

@LazySingleton(as: IntentRepository) //this is how we annotate an abstract class
class IntentRepositoryImpl implements IntentRepository {
  IntentDataSource intentDataSource;
  IntentRepositoryImpl(this.intentDataSource);

  @override

  @override
  Future<UserIntent> listen() async {
    return await intentDataSource.listen();
  }

  @override
  Future<void> stopListening() async {
    intentDataSource.stopListening();
  }
}
