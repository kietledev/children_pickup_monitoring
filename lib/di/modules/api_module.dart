import 'package:dio/dio.dart';
import 'package:children_pickup_monitoring/data/datasources/remote/remote.dart';

import '../injection.dart';

class ApiModule extends DIModule {
  @override
  Future<void> provides() async {
    /* Dio client */
    injector.registerSingleton<Dio>(Dio());

    /* Dependencies */
    injector.registerSingleton<LoginApiService>(LoginApiService(injector()));
  }
}
