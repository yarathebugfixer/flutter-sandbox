import 'package:tut_app/features/intent/data/models/UserIntent.dart';

abstract class IntentDataSource {
    Stream<UserIntent> listen();
   stopListening();
}
