import 'package:flutter_modular/flutter_modular.dart';

import 'bloc/home_bloc.dart';
import 'pages/home_page.dart';
import 'repositories/home_repository.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeBloc()),
        Bind((i) => HomeRepository(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomePage(),
        ),
      ];
}
