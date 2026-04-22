import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'service_locator.config.dart';

final sl = GetIt.instance;

@InjectableInit()
void configureDependencies()  =>  sl.init();

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio();
}