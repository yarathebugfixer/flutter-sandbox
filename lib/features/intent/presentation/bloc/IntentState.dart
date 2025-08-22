import 'package:equatable/equatable.dart';
import 'package:tut_app/features/intent/data/models/UserIntent.dart';

class IntentState extends Equatable {
  final bool isLoading;
  final UserIntent userIntent;
  final String errorMessage;

  const IntentState({
    required this.isLoading,
    required this.userIntent,
    required this.errorMessage,
  });

  /// initial state with no intent + not loading
  const IntentState.initial()
    : userIntent = const UserIntent(intent: "", parameters: {}),
      isLoading = false,
      errorMessage = "";

  IntentState copyWith({
    bool? isLoading,
    UserIntent? userIntent,
    String? errorMessage,
  }) {
    return IntentState(
      isLoading: isLoading ?? this.isLoading,
      userIntent: userIntent ?? this.userIntent,
      errorMessage: errorMessage ?? "",
    );
  }

  @override
  List<Object?> get props => [isLoading, userIntent, errorMessage];
}
