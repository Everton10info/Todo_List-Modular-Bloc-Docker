import 'package:flutter_modular/flutter_modular.dart';

import 'modules/splash/splash_module.dart';
import 'modules/Home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/todo', module: TodoModule()),
      ];
}
