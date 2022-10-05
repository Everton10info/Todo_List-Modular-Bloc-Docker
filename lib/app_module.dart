import 'package:flutter_modular/flutter_modular.dart';
import 'shared/app_http_client.dart';
import 'modules/splash/splash_module.dart';
import 'modules/todo/todo_module.dart';

class AppModule extends Module {

@override
List<Bind> get binds =>[
  Bind((i)=> HttpClient())
];

@override

 List<ModularRoute> get routes => [
       ModuleRoute('/', module: SplashModule()),
        ModuleRoute('/todo', module: TodoModule()),
       
      ];
}