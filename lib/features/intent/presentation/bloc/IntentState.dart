import 'package:equatable/equatable.dart';
import 'package:tut_app/features/intent/data/models/UserIntent.dart';

class IntentState extends Equatable {
  final bool isLoading;
  final UserIntent userIntent;

  const IntentState({
    required this.isLoading,
    required this.userIntent,
  });

  /// initial state with no intent + not loading
  const IntentState.initial()
      : userIntent =  const UserIntent(intent: "", parameters:  {}),
        isLoading = false;

  IntentState copyWith({
    bool? isLoading,
    UserIntent? userIntent,
  }) {
    return IntentState(
      isLoading: isLoading ?? this.isLoading,
      userIntent: userIntent ?? this.userIntent,
    );
  }

  @override
  List<Object?> get props => [isLoading, userIntent];
}
