// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:tut_app/features/number_fact/data/datasources/remote/NumberFactRemoteDataSource.dart'
    as _i831;
import 'package:tut_app/features/number_fact/data/datasources/remote/NumberFactRemoteDataSourceImpl.dart'
    as _i81;
import 'package:tut_app/features/number_fact/data/repositories/NumberFactRepositoryImpl.dart'
    as _i639;
import 'package:tut_app/features/number_fact/domain/repositories/NumberFactRepository.dart'
    as _i42;
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
    gh.lazySingleton<_i831.NumberFactRemoteDataSource>(
      () => _i81.NumberFactRemoteDataSourceImpl(),
    );
    gh.lazySingleton<_i42.NumberFactRepository>(
      () => _i639.NumberFactRepositoryImpl(
        gh<_i831.NumberFactRemoteDataSource>(),
      ),
    );
    gh.factory<_i440.GetNumberFactUseCase>(
      () => _i440.GetNumberFactUseCase(gh<_i42.NumberFactRepository>()),
    );
    gh.factory<_i932.NumberFactBloc>(
      () => _i932.NumberFactBloc(gh<_i440.GetNumberFactUseCase>()),
    );
    return this;
  }
}
