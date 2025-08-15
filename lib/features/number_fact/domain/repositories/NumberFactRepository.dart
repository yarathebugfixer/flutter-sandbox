import 'package:tut_app/features/number_fact/data/models/NumberFact.dart';
abstract class NumberFactRepository {
  Future<NumberFact> getNumberFact(int number);
}
