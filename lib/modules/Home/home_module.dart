import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_docker/modules/Home/controllers/home_controller.dart';
import 'package:modular_bloc_docker/modules/Home/repositories/home_repository.dart';

import '../../shared/helpers/app_http_client.dart';
import 'pages/home_page.dart';

class TodoModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => HttpClient()),
    Bind((i) => HomeRepository(i())),
    Bind((i) => HomeController(i()))];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomePage(),
        ),
      ];
}
