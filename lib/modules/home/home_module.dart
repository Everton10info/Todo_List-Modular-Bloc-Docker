import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_docker/modules/home/repositories/home_repository.dart';



import 'bloc/todo_bloc.dart';
import 'pages/home_page.dart';

class TodoModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => TodoBloc()),
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
