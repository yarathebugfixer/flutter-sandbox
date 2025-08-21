import 'package:tut_app/features/intent/data/models/UserIntent.dart';

abstract class IntentDataSource {
  Future<UserIntent> listen();
   stopListening();
}
