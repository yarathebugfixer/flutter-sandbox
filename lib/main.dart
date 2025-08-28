import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tut_app/app.dart';
import 'package:tut_app/core/settings/UserSettingsCubit.dart';
import 'package:tut_app/features/auth/presentation/bloc/AuthBloc.dart';
import 'package:tut_app/features/auth/presentation/bloc/AuthEvent.dart';
import 'package:tut_app/features/number_fact/presentation/bloc/NumberFactBloc.dart';
import 'package:tut_app/features/intent/presentation/bloc/IntentBloc.dart';
import 'package:tut_app/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  await Firebase.initializeApp();
  await configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AuthBloc>()..add(AppStartedEvent())),
        BlocProvider(create: (_) => getIt<NumberFactBloc>()),
        BlocProvider(create: (_) => getIt<IntentBloc>()),
        BlocProvider(create: (_) => getIt<SettingsCubit>()),
      ],
      child: App(),
    ),
  );
}
