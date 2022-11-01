import 'package:flutter_modular/flutter_modular.dart';

import 'bloc/home_bloc.dart';
import 'pages/edition_page.dart';
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
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute(
          '/editionPage',
          child: (context, args) => EditionPage(
              check: args.data['check'],
              name: args.data['name'],
              id: args.data['id']),
        )
      ];
}
