import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tut_app/features/intent/data/models/Intent.dart';
import 'package:tut_app/features/intent/domain/usecases/ExtractIntentUseCase.dart';
import 'package:tut_app/features/intent/domain/usecases/HandleIntentUseCase.dart';
import 'package:tut_app/features/intent/presentation/bloc/IntentEvent.dart';
import 'package:tut_app/features/intent/presentation/bloc/IntentState.dart';

@injectable
class IntentBloc extends Bloc<IntentEvent, IntentState> {
  final ExtractIntentUseCase extractIntentUseCase;
  final HandleIntentUseCase handleIntentUseCase;

  IntentBloc(
    this.extractIntentUseCase,
    this.handleIntentUseCase,
  ) : super(IntentState.initial()) {
    on<StartListeningIntentEvent>((event, emit) async {
      print("hi from bloc");
      final userIntentStream = await extractIntentUseCase.execute();
      var userIntent;
      userIntentStream.listen((data) => userIntent = data);

      final enumIntent = await handleIntentUseCase.execute(userIntent);
      add(IntentRecognizedEvent(enumIntent));
    });

    on<StopListeningIntentEvent>((event, emit) async {
      extractIntentUseCase.stop();
    });

    on<IntentRecognizedEvent>((event, emit) {
      switch (event.enumIntent) {
        case Intent.toggleDarkTheme:
          // themeCubit.setDark();
          break;
        case Intent.toggleLightTheme:
          // themeCubit.setLight();
          break;
        default:
          add(IntentErrorEvent("I don't have this function right now."));
      }
    });
    on<IntentErrorEvent>(
      (event, emit) => state.copyWith(errorMessage: event.message),
    );
  }
}
