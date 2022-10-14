import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_docker/shared/core/http_client/app_api.dart';

import 'modules/splash/splash_module.dart';
import 'modules/home/home_module.dart';
import 'shared/core/http_client/app_http_client.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => AppApi()),
        Bind((i) => HttpClient()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/todo', module: TodoModule()),
      ];
}
