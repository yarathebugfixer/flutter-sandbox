import 'package:tut_app/features/number_fact/data/models/NumberFact.dart';


abstract class NumberFactRemoteDataSource {
  Future<NumberFact> getNumberFact(int number);
}
