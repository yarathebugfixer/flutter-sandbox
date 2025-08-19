abstract class NumberFactEvent {}

class NumberFactRefreshedEvent extends NumberFactEvent {}

class NumberFactAICheckedEvent extends NumberFactEvent {
  final String fact;
  final int number;
  NumberFactAICheckedEvent(this.fact, this.number);
}
