// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:flutter_sound/flutter_sound.dart' as _i908;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:tut_app/core/settings/UserSettingsCubit.dart' as _i284;
import 'package:tut_app/features/auth/data/datasources/remote/FirebaseDataSource.dart'
    as _i576;
import 'package:tut_app/features/auth/data/datasources/remote/FirebaseDataSourceImpl.dart'
    as _i387;
import 'package:tut_app/features/auth/data/repositories/AuthRepositoryImpl.dart'
    as _i978;
import 'package:tut_app/features/auth/domain/repositories/AuthRepository.dart'
    as _i395;
import 'package:tut_app/features/auth/domain/usecases/GetCurrentUserUseCase.dart'
    as _i992;
import 'package:tut_app/features/auth/domain/usecases/LogOutUseCase.dart'
    as _i905;
import 'package:tut_app/features/auth/domain/usecases/SignInUseCase.dart'
    as _i758;
import 'package:tut_app/features/auth/domain/usecases/SignUpUseCase.dart'
    as _i531;
import 'package:tut_app/features/auth/presentation/bloc/AuthBloc.dart' as _i630;
import 'package:tut_app/features/intent/data/datasources/local/ai/IntentDataSource.dart'
    as _i503;
import 'package:tut_app/features/intent/data/datasources/local/ai/IntentDataSourceImpl.dart'
    as _i629;
import 'package:tut_app/features/intent/data/repositories/IntentRepositoryImpl.dart'
    as _i642;
import 'package:tut_app/features/intent/domain/repositories/IntentRepository.dart'
    as _i583;
import 'package:tut_app/features/intent/domain/usecases/ExtractIntentUseCase.dart'
    as _i503;
import 'package:tut_app/features/intent/domain/usecases/HandleIntentUseCase.dart'
    as _i464;
import 'package:tut_app/features/intent/presentation/bloc/IntentBloc.dart'
    as _i477;
import 'package:tut_app/features/number_fact/data/datasources/remote/ai/GeminiDataSource.dart'
    as _i734;
import 'package:tut_app/features/number_fact/data/datasources/remote/ai/GeminiDataSourceImpl.dart'
    as _i475;
import 'package:tut_app/features/number_fact/data/datasources/remote/api/NumberFactRemoteDataSource.dart'
    as _i943;
import 'package:tut_app/features/number_fact/data/datasources/remote/api/NumberFactRemoteDataSourceImpl.dart'
    as _i531;
import 'package:tut_app/features/number_fact/data/repositories/NumberFactRepositoryImpl.dart'
    as _i639;
import 'package:tut_app/features/number_fact/domain/repositories/NumberFactRepository.dart'
    as _i42;
import 'package:tut_app/features/number_fact/domain/usecases/FactCheckWithAIUseCase.dart'
    as _i685;
import 'package:tut_app/features/number_fact/domain/usecases/GetNumberFactUseCase.dart'
    as _i440;
import 'package:tut_app/features/number_fact/presentation/bloc/NumberFactBloc.dart'
    as _i932;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i284.SettingsCubit>(() => _i284.SettingsCubit());
    gh.factory<_i464.HandleIntentUseCase>(() => _i464.HandleIntentUseCase());
    gh.lazySingleton<_i943.NumberFactRemoteDataSource>(
      () => _i531.NumberFactRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i734.GeminiDataSource>(
      () => _i475.GeminiDataSourceImpl(),
    );
    gh.lazySingleton<_i503.IntentDataSource>(
      () => _i629.IntentDataSourceImpl(gh<_i908.FlutterSoundRecorder>()),
    );
    gh.lazySingleton<_i42.NumberFactRepository>(
      () => _i639.NumberFactRepositoryImpl(
        gh<_i943.NumberFactRemoteDataSource>(),
        gh<_i734.GeminiDataSource>(),
      ),
    );
    gh.lazySingleton<_i576.FirebaseDataSource>(
      () => _i387.FirebaseDataSourceImpl(
        gh<_i59.FirebaseAuth>(),
        gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.lazySingleton<_i395.AuthRepository>(
      () => _i978.AuthRepositoryImpl(gh<_i576.FirebaseDataSource>()),
    );
    gh.factory<_i758.SignInUseCase>(
      () => _i758.SignInUseCase(gh<_i395.AuthRepository>()),
    );
    gh.factory<_i905.LogOutUseCase>(
      () => _i905.LogOutUseCase(gh<_i395.AuthRepository>()),
    );
    gh.factory<_i531.SignUpUseCase>(
      () => _i531.SignUpUseCase(gh<_i395.AuthRepository>()),
    );
    gh.factory<_i992.GetCurrentUserUseCase>(
      () => _i992.GetCurrentUserUseCase(gh<_i395.AuthRepository>()),
    );
    gh.lazySingleton<_i583.IntentRepository>(
      () => _i642.IntentRepositoryImpl(gh<_i503.IntentDataSource>()),
    );
    gh.factory<_i440.GetNumberFactUseCase>(
      () => _i440.GetNumberFactUseCase(gh<_i42.NumberFactRepository>()),
    );
    gh.factory<_i685.FactCheckWithAIUseCase>(
      () => _i685.FactCheckWithAIUseCase(gh<_i42.NumberFactRepository>()),
    );
    gh.factory<_i630.AuthBloc>(
      () => _i630.AuthBloc(
        gh<_i531.SignUpUseCase>(),
        gh<_i758.SignInUseCase>(),
        gh<_i905.LogOutUseCase>(),
        gh<_i992.GetCurrentUserUseCase>(),
      ),
    );
    gh.factory<_i503.ExtractIntentUseCase>(
      () => _i503.ExtractIntentUseCase(gh<_i583.IntentRepository>()),
    );
    gh.factory<_i932.NumberFactBloc>(
      () => _i932.NumberFactBloc(
        gh<_i440.GetNumberFactUseCase>(),
        gh<_i685.FactCheckWithAIUseCase>(),
      ),
    );
    gh.factory<_i477.IntentBloc>(
      () => _i477.IntentBloc(
        gh<_i503.ExtractIntentUseCase>(),
        gh<_i464.HandleIntentUseCase>(),
      ),
    );
    return this;
  }
}
