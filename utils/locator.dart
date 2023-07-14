import 'package:ismarliyorum/repository/hive_repository.dart';

import 'package:ismarliyorum/services/hive_client.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.asNewInstance();

void setupLocator() {
  locator.registerLazySingleton(() => HiveClient());
  locator.registerLazySingleton(() => HiveRepository());
}
