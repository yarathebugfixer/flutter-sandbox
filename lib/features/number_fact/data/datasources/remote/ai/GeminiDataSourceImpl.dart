import 'package:injectable/injectable.dart';
import 'package:tut_app/features/number_fact/data/datasources/remote/ai/GeminiDataSource.dart';
import 'package:tut_app/features/number_fact/data/models/NumberFact.dart';
import 'package:firebase_ai/firebase_ai.dart';

@LazySingleton(as: GeminiDataSource)
class GeminiDataSourceImpl extends GeminiDataSource {
  final GenerativeModel model;
  GeminiDataSourceImpl()
    : model = FirebaseAI.googleAI().generativeModel(model: 'gemini-2.5-flash');
  // : syntax here is called an initializer list.
  // basically the constructor initializes everything it needs since
  // we aren't passing anything to it
  // kinda like constructor body in java
  @override
  Future<GenerateContentResponse> factCheckWithAI(NumberFact fact) async {
    var prompt = [
      Content.text(
"I have a fact about a number that I need you to fact-check. The number is ${fact.number} and the fact is: ${fact.text}. Please respond with:  1. An emoji indicating whether the fact is true or false.  2. The word **True** or **False** in bold.  3. A one-line explanation underneath. and have it all be one paragraph no new lines or streams"      ),
    ];
    
    return model.generateContent(prompt);
  }
}
