import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_docker/shared/core/http_client/app_api.dart';
//import 'package:modular_bloc_docker/shared/core/http_client/app_client_dio.dart';
import 'package:modular_bloc_docker/shared/core/http_client/app_client_http.dart';
import 'package:modular_bloc_docker/shared/core/http_client/app_http_interface.dart';

import 'modules/splash/splash_module.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => AppApi()),
        Bind.factory<HttpClientInterface>((i) => ClientHttp())
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/todo', module: TodoModule()),
      ];
}
