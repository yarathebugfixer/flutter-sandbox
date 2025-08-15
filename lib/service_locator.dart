import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'service_locator.config.dart'; // This will be generated

final getIt = GetIt.instance;

@injectableInit
void configureDependencies() => getIt.init();