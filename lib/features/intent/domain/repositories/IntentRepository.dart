import 'package:tut_app/features/intent/data/models/UserIntent.dart';

abstract class IntentRepository {
  Stream<UserIntent> listen();
  Future<void> stopListening();


}
