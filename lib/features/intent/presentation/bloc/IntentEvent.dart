import '../../data/models/Intent.dart';

abstract class IntentEvent {}

class StartListeningIntentEvent extends IntentEvent {}

class StopListeningIntentEvent  extends IntentEvent {}

class IntentRecognizedEvent  extends IntentEvent {
  final Intent enumIntent;
  IntentRecognizedEvent(this.enumIntent);
}


class IntentErrorEvent extends IntentEvent {
  final String message;
  IntentErrorEvent(this.message);
}