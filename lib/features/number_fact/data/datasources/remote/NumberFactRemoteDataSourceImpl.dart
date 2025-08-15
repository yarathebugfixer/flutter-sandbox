import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:tut_app/features/number_fact/data/datasources/remote/NumberFactRemoteDataSource.dart';
import 'package:tut_app/features/number_fact/data/models/NumberFact.dart';

@LazySingleton(as: NumberFactRemoteDataSource)
class NumberFactRemoteDataSourceImpl  extends NumberFactRemoteDataSource{
Future<NumberFact> getNumberFact(int number) async {
  final numbersAPIURI = Uri.parse("http://numbersapi.com/$number/trivia");

  try {
    final response = await http.get(numbersAPIURI);
  
    if (response.statusCode == 200) {
      return NumberFact(fact: response.body, number: number);
    } else {
      throw Exception("Error Code: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("HTTP request failed: $e");
  }
}
}
