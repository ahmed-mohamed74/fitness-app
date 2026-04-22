// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:fitness_app/core/api/api_consumer.dart' as _i418;
import 'package:fitness_app/core/api/dio_consumer.dart' as _i314;
import 'package:fitness_app/features/plan/data/repositories/plan_repository.dart'
    as _i656;
import 'package:fitness_app/features/plan/presentation/cubit/plan_cubit.dart'
    as _i1022;
import 'package:fitness_app/service_locator.dart' as _i622;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i418.ApiConsumer>(
      () => _i314.DioConsumer(dio: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i656.PlanRepository>(
      () => _i656.PlanRepositoryImpl(api: gh<_i418.ApiConsumer>()),
    );
    gh.factory<_i1022.PlanCubit>(
      () => _i1022.PlanCubit(planRepository: gh<_i656.PlanRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i622.RegisterModule {}
