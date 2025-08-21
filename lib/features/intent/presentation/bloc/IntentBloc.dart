import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tut_app/core/theme/ThemeCubit.dart';
import 'package:tut_app/features/intent/data/models/Intent.dart';
import 'package:tut_app/features/intent/domain/usecases/ExtractIntentUseCase.dart';
import 'package:tut_app/features/intent/domain/usecases/HandleIntentUseCase.dart';
import 'package:tut_app/features/intent/presentation/bloc/IntentEvent.dart';
import 'package:tut_app/features/intent/presentation/bloc/IntentState.dart';

@injectable
class IntentBloc extends Bloc<IntentEvent, IntentState> {
  final ExtractIntentUseCase extractIntentUseCase;
  final HandleIntentUseCase handleIntentUseCase;
  final ThemeCubit themeCubit;

  IntentBloc(
    this.extractIntentUseCase,
    this.handleIntentUseCase,
    this.themeCubit,
  ) : super(IntentState.initial()) {
    on<StartListeningIntentEvent>((event, emit) async {
      final userIntent = await extractIntentUseCase.execute();
      final enumIntent = await handleIntentUseCase.execute(userIntent);
      add(IntentRecognizedEvent(enumIntent));
    });

    on<StopListeningIntentEvent>((event, emit) async {
      extractIntentUseCase.stop();
    });

    on<IntentRecognizedEvent>((event, emit) {
      switch (event.enumIntent) {
        case Intent.toggleDarkTheme:
          themeCubit.setDark();
          break;
        case Intent.toggleLightTheme:
          themeCubit.setLight();
          break;
        default:
          themeCubit.toggle();
      }
    });
  }
}
