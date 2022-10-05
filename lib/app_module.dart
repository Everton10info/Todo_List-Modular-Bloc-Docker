import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_docker/shared/helpers/app_api.dart';
import 'package:modular_bloc_docker/shared/helpers/app_http_client.dart';

import 'modules/splash/splash_module.dart';
import 'modules/Home/home_module.dart';

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
