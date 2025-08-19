import 'package:firebase_ai/firebase_ai.dart';
import 'package:injectable/injectable.dart';
import 'package:tut_app/features/number_fact/data/datasources/remote/ai/GeminiDataSource.dart';
import 'package:tut_app/features/number_fact/data/models/NumberFact.dart';
import 'package:tut_app/features/number_fact/domain/repositories/NumberFactRepository.dart';
import 'package:tut_app/features/number_fact/data/datasources/remote/api/NumberFactRemoteDataSource.dart';

@LazySingleton(
  as: NumberFactRepository,
) //this is how we annotate an abstract class
class NumberFactRepositoryImpl implements NumberFactRepository {
  NumberFactRemoteDataSource numberFactRemoteDataSource;
  GeminiDataSource geminiDataSource;
  NumberFactRepositoryImpl(
    this.numberFactRemoteDataSource,
    this.geminiDataSource,
  );
  @override
  Future<NumberFact> getNumberFact(int number) async {
    return numberFactRemoteDataSource.getNumberFact(number);
  }

  @override
  Future<GenerateContentResponse> factCheckWithAI(NumberFact fact) async {
    return  geminiDataSource.factCheckWithAI(fact);
  }
}
