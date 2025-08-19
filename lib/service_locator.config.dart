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
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
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
    gh.lazySingleton<_i943.NumberFactRemoteDataSource>(
      () => _i531.NumberFactRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i734.GeminiDataSource>(
      () => _i475.GeminiDataSourceImpl(),
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
    gh.factory<_i932.NumberFactBloc>(
      () => _i932.NumberFactBloc(
        gh<_i440.GetNumberFactUseCase>(),
        gh<_i685.FactCheckWithAIUseCase>(),
      ),
    );
    return this;
  }
}
