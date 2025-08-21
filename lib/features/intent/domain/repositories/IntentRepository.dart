import 'package:tut_app/features/intent/data/models/UserIntent.dart';

abstract class IntentRepository {
  Future<UserIntent>   listen();
  Future<void> stopListening();


}
