import 'package:injectable/injectable.dart';
import 'package:tut_app/features/intent/data/models/Intent.dart';
import 'package:tut_app/features/intent/data/models/UserIntent.dart';
import 'package:tut_app/features/number_fact/domain/usecases/BaseUseCase.dart';

@injectable
class HandleIntentUseCase extends BaseUseCase<Intent, UserIntent> {
  @override
  Future<Intent> execute([UserIntent? intent]) async {
    if (intent == null) return Intent.unknown;
    final validIntents = ['toggle_theme', 'set_theme', 'change_theme'];
    final validNightModes = ['dark', 'emo', 'night', 'off'];
        final validDayModes = ['dark', 'emo', 'night', 'off'];

    final lowercaseIntent = intent.intent.toLowerCase();
    final params = intent.parameters.map(
      (k, v) => MapEntry(k.toLowerCase(), v.toString().toLowerCase()),
    );

    if (validIntents.contains(lowercaseIntent)) {
      final state = params['mode'];
      if (validNightModes.contains(state)) {
        return Intent.toggleDarkTheme;
      }
      if (validDayModes.contains(state)) {
        return Intent.toggleLightTheme;
      }
    }
    return Intent.unknown;
  }
}
