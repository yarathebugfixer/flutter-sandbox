import 'package:injectable/injectable.dart';
import 'package:tut_app/features/number_fact/data/models/NumberFact.dart';
import 'package:tut_app/features/number_fact/domain/repositories/NumberFactRepository.dart';
import 'package:tut_app/features/number_fact/data/datasources/remote/NumberFactRemoteDataSource.dart';

@LazySingleton(as: NumberFactRepository) //this is how we annotate an abstract class
class NumberFactRepositoryImpl implements NumberFactRepository {
  NumberFactRemoteDataSource numberFactRemoteDataSource;
  NumberFactRepositoryImpl(this.numberFactRemoteDataSource);
  @override
  Future<NumberFact> getNumberFact(int number) async {
    return numberFactRemoteDataSource.getNumberFact(number);
  }
}
