import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';
import 'modules/splash/splash_module.dart';
import 'shared/core/http_client/app_client_dio.dart';
import 'shared/core/http_client/app_http_interface.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<HttpClientInterface>((i) => ClientDio()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/home', module: HomeModule())
      ];
}
