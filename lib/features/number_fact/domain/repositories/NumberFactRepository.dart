import 'package:firebase_ai/firebase_ai.dart';
import 'package:tut_app/features/number_fact/data/models/NumberFact.dart';
abstract class NumberFactRepository {
  Future<NumberFact> getNumberFact(int number);
  Future<GenerateContentResponse> factCheckWithAI(NumberFact fact);

}
