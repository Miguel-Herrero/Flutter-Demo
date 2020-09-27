import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:flutter_demo/app/locator.config.dart';

final locator = GetIt.instance;

@InjectableInit(generateForDir: ['lib'])
void setupLocator(String environment) =>
    $initGetIt(locator, environment: environment);

abstract class Env {
  static const dev = Environment.dev;
  static const prod = Environment.prod;
  static const fake = 'fake';
}
